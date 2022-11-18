resource "aws_instance" "phpserver1" {
  ami           = "ami-00e912d13fbb4f225"
  instance_type = "t2.micro"
  key_name = "mumbai-region"
  subnet_id = aws_subnet.public_web1.id
  vpc_security_group_ids = [aws_security_group.sg-php.id]
  associate_public_ip_address = true

  tags = {
    Name = "php-server1"
  }
}

resource "aws_instance" "phpserver2" {
  ami           = "ami-00e912d13fbb4f225"
  instance_type = "t2.micro"
  key_name = "mumbai-region"
  subnet_id = aws_subnet.public_web2.id
  vpc_security_group_ids = [aws_security_group.sg-php.id]
  associate_public_ip_address = true

  tags = {
    Name = "php-server2"
  }

  # provisioner "local-exec" { command = "sleep 30" }

  # provisioner "local-exec" { command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${self.public_ip},' --private-key ${var.ssh_private_key} ansible/playbook.yml" }

  # provisioner "local-exec" { command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${self.public_ip},' --private-key ${var.ssh_private_key} tig/telegraf.yml" }


}

