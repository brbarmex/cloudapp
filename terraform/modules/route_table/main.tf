resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  tags = var.tags
  
}

resource "aws_route_table_association" "route_table_association" {
  route_table_id = aws_route_table.route_table.id

  for_each = { for idx, cidr_block in var.subnet_ids : idx => cidr_block }
  subnet_id = each.value
}