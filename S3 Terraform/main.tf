terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

 provider "aws" {
  region     = "us-east-2"
}

resource "aws_s3_bucket" "example" {
  bucket = "maldonadobucketdevops"

  tags = {
    Name        = "maldonadobucketdevops"
    Environment = "Dev"
  }
}