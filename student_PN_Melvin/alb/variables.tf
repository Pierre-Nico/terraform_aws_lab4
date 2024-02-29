variable "vpc_id" {
  description = "The VPC ID for the ALB."
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB."
  type        = list(string)
}

variable "nginx_target_group_arn" {
  description = "ARN for the NGINX target group."
  type        = string
}

variable "tomcat_target_group_arn" {
  description = "ARN for the TOMCAT target group."
  type        = string
}

variable "alb_security_group_id" {
  description = "The ID of the Security Group to attach to the ALB."
  type        = string
}
