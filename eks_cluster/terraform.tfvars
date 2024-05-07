# security group
security_group_name                    = "all"
security_group_description             = "security group for all"
security_group_name_eks_cluster        = "eks_cluster"
security_group_description_eks_cluster = "security group for eks cluster"
port_80                                = 80
port_443                               = 443
port_22                                = 22
port_3000                              = 3000
# port_8080                              = 8080
# port_8081                              = 8081
port_10250              = 10250
port_30007              = 30007
port_9000               = 9000
port_9090               = 9090
port_9100               = 9100
port_9443               = 9443
port_3306               = 3306
security_group_protocol = "tcp"
web_cidr                = "0.0.0.0/0"
private_ip_address      = "70.51.61.104/32"
private_subnet          = "10.0.0.0/16"

# vpc
vpc_cidr_block                   = "10.0.0.0/16"
vpc_name                         = "vpc"
public_subnet_cidr_blocks        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr_blocks       = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
availability_zones               = ["us-east-1a", "us-east-1b", "us-east-1c"]
aws_subnet_public_name           = "public_subnets"
aws_subnet_public_eks_alb        = "kubernetes.io/role/elb"
aws_subnet_public_eks_alb_value  = 1
aws_subnet_private_name          = "private_subnets"
aws_subnet_private_eks_alb       = "kubernetes.io/role/internal-elb"
aws_subnet_private_eks_alb_value = 1


# Internet Gateway variables
igw_name = "igw"

# Route Table variables
rt_name = "route-table"

# Route Table Association variables
rt_association = "rt-association"

# eks
eks_cluster_netflix_name                       = "eks-netflix-cluster"
aws_eks_node_group_netflix_name                = "eks-node-group"
aws_eks_node_group_instance_types              = "m5.large"
aws_eks_node_group_desired_capacity            = 3
aws_eks_node_group_min_size                    = 3
aws_eks_node_group_max_size                    = 3
aws_eks_node_group_launch_template_name_prefix = "netflix"
aws_eks_node_group_launch_template_version     = "$Latest"
aws_eks_node_group_device_name                 = "xvda"
aws_eks_node_group_volume_size                 = 20
aws_eks_cluster_netflix_version                = "1.29"
# aws_eks_addon_netflix_addon_name                        = "vpc-cni"
# aws_eks_addon_netflix_addon_version                     = "v1.18.0-eksbuild.1"
addons = {
  vpc_cni = {
    addon_name    = "vpc-cni"
    addon_version = "v1.18.0-eksbuild.1"
  },
  kube_proxy = {
    addon_name    = "kube-proxy"
    addon_version = "v1.29.3-eksbuild.2"
  }
  # coredns = {
  #   addon_name    = "coredns"
  #   addon_version = "v1.11.1-eksbuild.6"
  # }
}
# node_group_tags = [
#     {
#       Name  = "tag1"
#       Value = "value1"
#     },
#     {
#       Name  = "tag2"
#       Value = "value2"
#     },
#     # Add more tag sets as needed
# ]


aws_eks_cluster_netflix_enabled_cluster_log_types       = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
aws_instance_eks_cluster_netflix_bastion_host_file_type = "ssh"
aws_instance_eks_cluster_netflix_bastion_host_file_user = "ubuntu"

# asg
key_pair_name                                                 = "web-ec2"
aws_launch_template_netflix_name_prefix                       = "netflix-launch-template"
aws_launch_template_netflix_image_id                          = "ami-07ed6bbc95d3a2010"
aws_launch_template_netflix_instance_type                     = "m5.large"
aws_launch_template_netflix_block_device_mappings_device_name = "xvdc"
aws_launch_template_netflix_block_device_mappings_volume_size = 20
aws_launch_template_netflix_create_before_destroy             = true
aws_autoscaling_group_netflix_desired_capacity                = 2
aws_autoscaling_group_netflix_max_size                        = 4
aws_autoscaling_group_netflix_min_size                        = 1
aws_autoscaling_group_netflix_launch_template_version         = "$Latest"
aws_autoscaling_group_netflix_tag_key                         = "Environment"
aws_autoscaling_group_netflix_tag_value                       = "Dev"
aws_autoscaling_group_netflix_tag_propagate_at_launch         = true
aws_launch_template_netflix_user_data                         = <<-EOT
#!/bin/bash
set -x
AWS_REGION="us-east-1"
CLUSTER_NAME="eks-netflix-cluster"
NODE_GROUP_INSTANCE_TYPE="m5.large"
KUBERNETES_VERSION="1.29"

set -x
sudo -u ubuntu /snap/bin/aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME

set -x
curl -O https://raw.githubusercontent.com/awslabs/amazon-eks-ami/master/files/max-pods-calculator.sh
chmod +x max-pods-calculator.sh

CERTIFICATE_AUTHORITY=$(sudo -u ubuntu /snap/bin/aws eks describe-cluster --query "cluster.certificateAuthority.data" --output text --name $CLUSTER_NAME --region $AWS_REGION)

API_SERVER_ENDPOINT=$(sudo -u ubuntu /snap/bin/aws eks describe-cluster --region $AWS_REGION --name $CLUSTER_NAME --query "cluster.endpoint" --output text)

SERVICE_CIDR=$(sudo -u ubuntu /snap/bin/aws eks describe-cluster --query "cluster.kubernetesNetworkConfig.serviceIpv4Cidr" --output text --name $CLUSTER_NAME --region $AWS_REGION | sed 's/\.0\/16//')

CNI_VERSION=$(sudo -u ubuntu /snap/bin/aws eks describe-addon-versions --addon-name vpc-cni --kubernetes-version $KUBERNETES_VERSION --region $AWS_REGION | jq -r '.addons[] | select(.addonName == "vpc-cni") | .addonVersions[].addonVersion' | head -n 1 | sed 's/^v//')

MAX_PODS=$(/etc/eks/max-pods-calculator.sh --instance-type $NODE_GROUP_INSTANCE_TYPE --cni-version $CNI_VERSION)


sudo chmod +x /etc/eks/bootstrap.sh
set -x
/etc/eks/bootstrap.sh $CLUSTER_NAME \
  --b64-cluster-ca $CERTIFICATE_AUTHORITY \
  --apiserver-endpoint $API_SERVER_ENDPOINT \
  --dns-cluster-ip $SERVICE_CIDR.10 \
  --kubelet-extra-args "--max-pods=$MAX_PODS" \
  --use-max-pods false


# Install Argocd
sudo -u ubuntu /usr/bin/kubectl create namespace argocd 
sudo -u ubuntu /usr/bin/kubectl apply -n argocd -f https://raw.githubusercontent.com/lightninglife/argo-cd/master/argocd.yaml

# Install Node Exporter using Helm
sudo -u ubuntu /usr/bin/curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
sudo chmod 777 /usr/local/bin/helm
sudo -u ubuntu /usr/local/bin/helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
sudo -u ubuntu /usr/bin/kubectl create namespace prometheus-node-exporter
sudo -u ubuntu /usr/local/bin/helm install prometheus-node-exporter prometheus-community/prometheus-node-exporter --namespace prometheus-node-exporter
sudo chmod 755 /usr/local/bin/helm

export ARGOCD_SERVER=`sudo -u ubuntu /usr/bin/kubectl get svc argocd-server -n argocd -o json | jq --raw-output '.status.loadBalancer.ingress[0].hostname'`
echo $ARGOCD_SERVER
export ARGO_PWD=`sudo -u ubuntu /usr/bin/kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`
echo $ARGO_PWD

sudo docker start -a $(sudo docker ps -aqf "status=exited")


EOT

#iam
aws_iam_role_eks_cluster_netflix_name                             = "netflix-cluster-role"
aws_iam_role_eks_nodegroup_role_netflix_name                      = "netflix-nodegroup-role"
data_http_lbc_iam_policy_url                                      = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"
data_http_lbc_iam_policy_request_headers_accept                   = "application/json"
aws_iam_role_policy_attachment_eks_AmazonEKSClusterPolicy         = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
aws_iam_role_policy_attachment_eks_AmazonEKSVPCResourceController = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
aws_iam_role_eks_nodegroup_role_netflix_assume_role_policy = {
  Statement = [

    {
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = ["ec2.amazonaws.com", "eks.amazonaws.com"]
      }
    }
  ]
}
aws_iam_policy_attachment_eks_worker_node_policy_name                    = "eks-worker-node-policy-attachment"
aws_iam_policy_attachment_eks_worker_node_policy_policy_arn              = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
aws_iam_policy_attachment_eks_cni_policy_name                            = "eks_cni-policy"
aws_iam_policy_attachment_eks_cni_policy_policy_arn                      = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
aws_iam_policy_attachment_eks_ec2_container_registry_readonly_name       = "eks_worker_nodes_policy"
aws_iam_policy_attachment_eks_ec2_container_registry_readonly_policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

# bastion
aws_instance_eks_cluster_netflix_bastion_host_ami                     = "ami-07ed6bbc95d3a2010"
aws_instance_eks_cluster_netflix_bastion_host_instance_type           = "t2.micro"
aws_instance_eks_cluster_netflix_bastion_host_tags                    = "bastion-host"
aws_instance_eks_cluster_netflix_bastion_host_provisioner_destination = "/home/ubuntu/web-ec2.pem"
aws_instance_eks_cluster_netflix_bastion_host_remote_exec_inline      = ["sudo chmod 400 /home/ubuntu/web-ec2.pem"]