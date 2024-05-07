# netflix

resource "aws_launch_template" "netflix" {
  name_prefix   = var.aws_launch_template_netflix_name_prefix # "web-lt"
  image_id      = var.aws_launch_template_netflix_image_id # "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID
  instance_type = var.aws_launch_template_netflix_instance_type # "t2.micro"

  user_data = base64encode(var.aws_launch_template_netflix_user_data) # file("${path.module}/../web_userdata.sh")
  
  vpc_security_group_ids = var.aws_launch_template_netflix_vpc_security_group_ids
  
  block_device_mappings {
    device_name = var.aws_launch_template_netflix_block_device_mappings_device_name # "/dev/sda1"
    ebs {
      volume_size = var.aws_launch_template_netflix_block_device_mappings_volume_size # 20
    }
  }
  
  key_name = var.key_pair_name
  
  # network_interfaces {
  #   security_groups = var.aws_launch_template_netflix_network_interfaces_security_groups
  #   associate_public_ip_address = true
  # }


  lifecycle {
    create_before_destroy = true # var.aws_launch_template_web_create_before_destroy # true
  }
}