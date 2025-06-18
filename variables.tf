variable "AWS_REGION" {
  type    = string
  default = "us-east-1"
}

variable "dev_ops_vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "finance_vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "dev_ops_public_subnet_cidr" {
  default = "10.0.1.0/24"
}
variable "finance_public_subnet_cidr" {
  default = "10.1.1.0/24"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = ""
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}