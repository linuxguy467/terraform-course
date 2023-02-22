terraform {
  backend "remote" {
    organization = "matthem-web-app-org"

    workspaces {
      name = "matthem-web-app-terraform-course"
    }
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
