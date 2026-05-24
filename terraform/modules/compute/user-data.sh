#!/bin/bash
yum update -y
yum install -y docker aws-cli

systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# Wait for Docker daemon to be ready
while ! docker info > /dev/null 2>&1; do sleep 1; done

# Authenticate with ECR
aws ecr get-login-password --region eu-west-1 \
  | docker login --username AWS --password-stdin <ECR_URL>

# Pull and run
docker pull <ECR_IMAGE>:latest

docker run -d \
  -p 8080:8080 \
  --name backend \
  --restart unless-stopped \
  <ECR_IMAGE>:latest