output "dev_ops_vpc_id" { value = module.vpc_dev_ops.vpc_id }
output "finance_vpc_id" { value = module.vpc_finance.vpc_id }
output "vpc_peering_connection_id" { value = module.vpc_peering.peering_id }

output "dev_ops_public_ip" { value = module.ec2_dev_ops.public_ip }
output "finance_public_ip" { value = module.ec2_finance.public_ip }