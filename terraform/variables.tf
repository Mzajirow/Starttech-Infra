variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "docker_image" {
  description = "Docker image URL"
  type        = string
}