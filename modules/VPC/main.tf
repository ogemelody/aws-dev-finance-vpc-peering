data "aws_availability_zones" "azs" {}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = { Name = var.vpc_name }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${var.vpc_name}-igw" }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.azs.names[0]
  map_public_ip_on_launch = true
  tags                    = { Name = "${var.vpc_name}-public-subnet" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${var.vpc_name}-public-rt" }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "default_igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_security_group" "public_sg" {
  name        = "${var.vpc_name}-sg"
  description = "Base SG for ${var.vpc_name} EC2"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH from anywhere"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.vpc_name}-sg" }
}