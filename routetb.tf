resource "aws_route_table" "route-tb" {
  vpc_id = aws_vpc.php-app.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "internet-gateway-to-routetb"
  }
}

resource "aws_route_table_association" "rt-web1" {
  subnet_id      = aws_subnet.public_web1.id
  route_table_id = aws_route_table.route-tb.id
}
resource "aws_route_table_association" "rt-web2" {
  subnet_id      = aws_subnet.public_web2.id
  route_table_id = aws_route_table.route-tb.id
}
