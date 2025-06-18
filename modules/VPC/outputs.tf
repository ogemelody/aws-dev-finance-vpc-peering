output "vpc_id"                {
  value = aws_vpc.vpc.id
}

output "public_subnet_id"      {
  value = aws_subnet.public.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "sg_id"                 {
  value = aws_security_group.public_sg.id
}