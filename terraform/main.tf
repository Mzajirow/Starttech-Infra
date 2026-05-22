terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source       = "./modules/networking"
  project_name = var.project_name
}

module "compute" {
  source         = "./modules/compute"
  ami_id         = var.ami_id
  docker_image   = var.docker_image
  vpc_id         = module.networking.vpc_id
  public_subnets = module.networking.public_subnets
  project_name   = var.project_name
}

module "storage" {
  source       = "./modules/storage"
  project_name = var.project_name
}

module "monitoring" {
  source       = "./modules/monitoring"
  project_name = var.project_name
}

module "cache" {
  source          = "./modules/cache"
  vpc_id          = module.networking.vpc_id
  private_subnets = module.networking.public_subnets
  project_name    = var.project_name
  ec2_sg_id       = module.compute.ec2_sg_id
}

terraform {
  backend "s3" {
    bucket         = "starttech-terraform-state2503"
    key            = "infra/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "starttech-terraform-locks"
    encrypt        = true
  }
}
