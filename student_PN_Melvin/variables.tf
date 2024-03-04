variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "eu-west-3"
}

variable "vpc_id" {
  description = "The VPC ID where network resources will be created."
  type        = string
  default     = "vpc-0332be90c61c665ac"
}

