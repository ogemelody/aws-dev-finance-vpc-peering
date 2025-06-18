variable "subnet_id"         {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "instance_name"     {
  type = string
}

variable "instance_type"     {
  type = string
}

variable "key_name"          {
  type = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

