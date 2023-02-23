#General
variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "us-east-1"
}

# EC2
variable "ami" {
  description = "Amazon machine image to use for EC2 instance"
  type        = string
  default     = "ami-011899242bb902164"
}

variable "instance_type" {
  description = "Instance type for EC2 instance"
  type        = string
  default     = "t2.micro"
}

#S3
variable "bucket_prefix" {
  description = "prefix of s3 bucket for app data"
  type        = string
}

#Route53
variable "domain" {
  description = "Domain for website"
  type        = string
}

#RDS
variable "db_name" {
  description = "Name of DB"
  type        = string
}

variable "db_user" {
  description = "Username for DB"
  type        = string
}

variable "db_pass" {
  description = "Password for DB"
  type        = string
  sensitive   = true
}
