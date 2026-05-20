#!/bin/bash
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker

aws ecr get-login-password --region eu-west-1 \
| docker login --username AWS --password-stdin <ECR_URL>

docker pull <ECR_IMAGE>:latest

docker run -d -p 8080:8080 --name backend <ECR_IMAGE>:latest