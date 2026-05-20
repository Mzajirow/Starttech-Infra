variable "vpc_id" {}
variable "private_subnets" {
  type = list(string)
}
variable "project_name" {}
variable "ec2_sg_id" {}