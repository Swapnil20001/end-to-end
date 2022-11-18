# resource "aws_launch_configuration" "foobar" {
#   name_prefix   = "launch configuration"
#   image_id      = "ami-034dd70f18b67c5cb"
#   instance_type = "t2.micro"
#   security_groups = [aws_security_group.sg-php.id]
#   associate_public_ip_address = true
# }

# resource "aws_autoscaling_group" "bar" {
#   desired_capacity   = 2
#   max_size           = 3
#   min_size           = 1
#   health_check_grace_period = 300
#   vpc_zone_identifier = [aws_subnet.public_web1.id, aws_subnet.public_web2.id]
#   launch_configuration = aws_launch_configuration.foobar.name
#   health_check_type   = "ELB"
# }
# resource "aws_autoscaling_attachment" "bar" {
#   autoscaling_group_name = aws_autoscaling_group.bar.id
#   lb_target_group_arn    = aws_lb_target_group.target-alb.arn
# }