resource "aws_subnet" "public_web1" {
 vpc_id = aws_vpc.php-app.id
  cidr_block = "150.0.0.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "web1-sub"
  }
}

resource "aws_subnet" "public_web2" {
  vpc_id = aws_vpc.php-app.id
  cidr_block = "150.0.1.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "web1-sub"
  }
}


