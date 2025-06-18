resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = var.requester_vpc_id
  peer_vpc_id = var.accepter_vpc_id
  auto_accept = true
  tags        = { Name = "dev_ops-finance-peering" }
}

resource "aws_route" "requester_to_accepter" {
  route_table_id            = var.requester_route_table
  destination_cidr_block    = var.accepter_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "accepter_to_requester" {
  route_table_id            = var.accepter_route_table
  destination_cidr_block    = var.requester_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
