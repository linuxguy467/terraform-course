terraform {
  # Assumes s3 bucket and DynamoDB Table are set up
  backend "s3" {
    bucket         = "matthem-tf-state"
    key            = "07-managing-multiple-environments/global/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_route53_zone" "primary" {
  name = "matthemdeployed.com"
}
