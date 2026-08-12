terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "my-algadelivery-tfstate"
    key    = "${var.environment}/s3/${var.bucket_name}/remote.tfstate"
    region = var.aws_region
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "algadelivery-test-tofu" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.algadelivery-test-tofu.id
  versioning_configuration {
    status = var.bucket_versioning
  }
}