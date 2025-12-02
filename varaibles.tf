# Defineing a Terraform variable called "aws_region"
variable "aws_region" {
  description = "AWS region to deploy resources in"
  default     = "us-east-1"
}
