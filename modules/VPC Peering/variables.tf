variable "requester_vpc_id"      {
  type = string
}

variable "accepter_vpc_id"       {
  type = string
}

variable "requester_cidr_block"  {
  type = string
}

variable "accepter_cidr_block"   {
  type = string
}
variable "requester_route_table" {
  type = string
}

variable "accepter_route_table"  {
  type = string
}