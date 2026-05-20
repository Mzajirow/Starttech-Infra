variable "vpc_id" {}

variable "public_subnets" {
  type = list(string)
}
variable "project_name" {}

variable "ami_id" {
  description = "Ubuntu AMI"
}

variable "docker_image" {
  description = "Backend docker image"
}