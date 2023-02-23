variable "instance_name" {
  description = "Name of ec2 instance"
  type        = string
}

variable "ami" {
  description = "Amazon Machine Image to use for ec2 instance"
  type        = string
  default     = "ami-011899242bb902164"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "db_user" {
  description = "username for db"
  type        = string
  default     = "foo"
}

variable "db_pass" {
  description = "password for db"
  type        = string
  sensitive   = true
}
