resource "aws_vpc" "php-app" {
  cidr_block = "150.0.0.0/16"
  instance_tenancy = "default"
  
  tags = {
    Name = "phpVPC"
  }
}