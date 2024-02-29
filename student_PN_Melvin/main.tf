provider "aws" {
  region = "eu-west-3"
}

module "network" {
  source = "./network"
  vpc_id = var.vpc_id
  aws_region = var.aws_region
}

