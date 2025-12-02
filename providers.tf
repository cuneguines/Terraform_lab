# Specify the minimum required Terraform version to run this code.
# Ensures that anyone using this configuration has a compatible Terraform version
# with the features used in this code. Here, >= 1.3.0 means Terraform 1.3.0 or higher.
# The AWS region where resources will be created.
# It references a Terraform variable (var.aws_region), making this configuration reusable.
# By using a variable instead of hardcoding, you can deploy to different regions easily.
terraform {
  required_version = ">= 1.3.0"

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
