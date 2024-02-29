variable "vpc_id" {
  description = "VPC id where the Tomcat instance will be deployed."
}

variable "security_group_id" {
  description = "The ID of the security group to attach to the Tomcat EC2 instance."
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Tomcat EC2 instance."
  type        = list(string)
}
variable "tomcat_target_group_arn" {
  description = "The ARN of the Target Group for the Tomcat instance."
  type        = string
}
