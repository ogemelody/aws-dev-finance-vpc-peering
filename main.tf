#########################################################
# ---------- VPCs ----------
#########################################################


module "vpc_dev_ops" {
  source             = "./modules/vpc"
  vpc_cidr           = var.dev_ops_vpc_cidr
  public_subnet_cidr = var.dev_ops_public_subnet_cidr
  vpc_name           = "dev_ops-vpc"
}

module "vpc_finance" {
  source             = "./modules/vpc"
  vpc_cidr           = var.finance_vpc_cidr
  public_subnet_cidr = var.finance_public_subnet_cidr
  vpc_name           = "finance-vpc"
}

#########################################################
# ---------- EC2 ----------
#########################################################
module "ec2_dev_ops" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  subnet_id         = module.vpc_dev_ops.public_subnet_id
  security_group_id = module.vpc_dev_ops.sg_id
  instance_name     = "dev_ops-ec2"
  instance_type     = var.instance_type
  key_name          = var.key_name
}

module "ec2_finance" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  subnet_id         = module.vpc_finance.public_subnet_id
  security_group_id = module.vpc_finance.sg_id
  instance_name     = "finance-ec2"
  instance_type     = var.instance_type
  key_name          = var.key_name
}



#########################################################
#---------- VPC Peering ----------
########################################################
module "vpc_peering" {
  source                = "./modules/VPC Peering"
  requester_vpc_id      = module.vpc_dev_ops.vpc_id
  accepter_vpc_id       = module.vpc_finance.vpc_id
  requester_cidr_block  = var.dev_ops_vpc_cidr
  accepter_cidr_block   = var.finance_vpc_cidr
  requester_route_table = module.vpc_dev_ops.public_route_table_id
  accepter_route_table  = module.vpc_finance.public_route_table_id
}