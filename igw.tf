resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.php-app.id

  tags = {
    Name = "IGW-php"
  }
}