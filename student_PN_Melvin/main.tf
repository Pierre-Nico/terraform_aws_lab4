provider "aws" {
  region = "eu-west-3"
}

module "network" {
  source = "./network"
  vpc_id = var.vpc_id
  aws_region = var.aws_region
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = var.vpc_id  
}

module "target_groups" {
  source  = "./target_groups"
  vpc_id  = var.vpc_id
}

module "alb" {
  source                 = "./alb"
  vpc_id                 = var.vpc_id
  public_subnet_ids      = [module.network.public_subnet_id_a, module.network.public_subnet_id_b]
  nginx_target_group_arn = module.target_groups.nginx_target_group_arn
  tomcat_target_group_arn = module.target_groups.tomcat_target_group_arn
  alb_security_group_id  = module.security_groups.student_2_3_public_sg_id
}

module "tomcat" {
  source           = "./tomcat"
  vpc_id           = var.vpc_id
  security_group_id = module.security_groups.student_2_3_internal_sg_id
  subnet_ids        = [module.network.private_subnet_id]
  tomcat_target_group_arn = module.target_groups.tomcat_target_group_arn
}

module "nginx" {
  source                = "./nginx"
  vpc_id                = var.vpc_id
  security_group_id     = module.security_groups.student_2_3_internal_sg_id
  subnet_ids            = [module.network.private_subnet_id]
  nginx_target_group_arn = module.target_groups.nginx_target_group_arn
}
