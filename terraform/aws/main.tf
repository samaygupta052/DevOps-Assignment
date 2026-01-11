terraform {
  required_version = ">= 1.5"

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

module "vpc" {
  source = "../modules/vpc"
}

module "ecs" {
  source = "../modules/ecs"

  project_name  = var.project_name
  aws_region    = var.aws_region
  aws_account_id = var.aws_account_id

  vpc_id        = module.vpc.vpc_id
  subnets       = module.vpc.public_subnets

  backend_image  = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/backend:${var.image_tag}"
  frontend_image = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/frontend:${var.image_tag}"


  backend_url = "http://${aws_lb.this.dns_name}"
}


