terraform {
  # Assumes s3 bucket and DynamoDB Table are set up
  backend "s3" {
    bucket         = "matthem-tf-state"
    key            = "web-app/terraform/terraform.tfstate"
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

variable "db_pass_1" {
  description = "Password for DB"
  type        = string
  sensitive   = true
}

variable "db_pass_2" {
  description = "Password for DB"
  type        = string
  sensitive   = true
}

module "web_app_1" {
  source = "../web-app-module"

  # Input Variables
  bucket_prefix    = "web-app-1-matthem-deployed-data"
  domain           = "matthemdeployed.com"
  app_name         = "web-app-1"
  environment_name = "production"
  instance_type    = "t2.small"
  create_dns_zone  = true
  db_name          = "webapp1db"
  db_user          = "foo"
  db_pass          = var.db_pass_1
}

module "web_app_2" {
  source = "../web-app-module"

  # Input Variables
  bucket_prefix    = "web-app-2-matthem-deployed-data"
  domain           = "anothermatthemdeployed.com"
  app_name         = "web-app-2"
  environment_name = "production"
  instance_type    = "t2.small"
  create_dns_zone  = true
  db_name          = "webapp2db"
  db_user          = "foo"
  db_pass          = var.db_pass_2
}
