resource "aws_lb" "app-lb" {
  name               = "application-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-php.id]
  subnets            = [aws_subnet.public_web1.id, aws_subnet.public_web2.id]


  tags = {
    Name = "php-loadbalancer"
  }
}




resource "aws_lb_target_group" "target-alb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.php-app.id
}

resource "aws_lb_target_group_attachment" "first" {
  target_group_arn = aws_lb_target_group.target-alb.arn
  target_id        = aws_instance.phpserver1.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "test2" {
  target_group_arn = aws_lb_target_group.target-alb.arn
  target_id        = aws_instance.phpserver2.id
  port             = 80
}


resource "aws_lb_listener" "app-lb" {
  load_balancer_arn = aws_lb.app-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-alb.arn
  }
}