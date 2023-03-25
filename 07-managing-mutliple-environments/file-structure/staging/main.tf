terraform {
  # Assumes s3 bucket and DynamoDB Table are set up
  backend "s3" {
    bucket         = "matthem-tf-state"
    key            = "07-managing-multiple-environments/staging/terraform.tfstate"
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

variable "db_pass" {
  description = "Password for DB"
  type        = string
  sensitive   = true
}

locals {
  environment_name = "staging"
}

module "web_app" {
  source = "../../../06-organization-and-modules/web-app-module"

  # Input Variables
  bucket_prefix    = "web-app-data-${local.environment_name}"
  domain           = "matthemdeployed.com"
  environment_name = local.environment_name
  instance_type    = "t2.small"
  create_dns_zone  = false
  db_identifier    = "web-app-${local.environment_name}-db"
  db_name          = "${local.environment_name}db"
  db_user          = "foo"
  db_pass          = var.db_pass
}
