variable "vpc_id" {
  description = "VPC id where the Nginx instance will be deployed."
}

variable "security_group_id" {
  description = "The ID of the security group to attach to the Nginx EC2 instance."
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Nginx EC2 instance."
  type        = list(string)
}

variable "nginx_target_group_arn" {
  description = "The ARN of the Target Group for the Nginx instance."
  type        = string
}
