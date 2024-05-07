#!/bin/bash

# Execute your command to retrieve api server endpoint data
api_endpoint=$(sudo -u ubuntu aws eks describe-cluster --region us-east-1 --name eks-netflix-cluster --query "cluster.endpoint" --output text)

# Construct a JSON object with the api server endpoint data
cat <<EOF
{
  "api_endpoint": "$api_endpoint"
}
EOF
