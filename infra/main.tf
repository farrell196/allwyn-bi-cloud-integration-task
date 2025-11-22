terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Region can be anything, just an example
  region = "eu-west-1"
}

# S3 bucket for Dev environment
resource "aws_s3_bucket" "dev_bucket" {
  bucket = "allwyn-dev-bucket-farrell"

  tags = {
    Environment = "dev"
    Purpose     = "customer_orders_data_lake"
  }
}

# S3 bucket for Prod environment
resource "aws_s3_bucket" "prod_bucket" {
  bucket = "allwyn-prod-bucket-farrell"

  tags = {
    Environment = "prod"
    Purpose     = "customer_orders_data_lake"
  }
}

