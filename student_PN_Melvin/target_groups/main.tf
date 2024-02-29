resource "aws_lb_target_group" "nginx" {
  name     = "student-2-3-nginx-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 6
    matcher             = "200"
  }
}

resource "aws_lb_target_group" "tomcat" {
  name     = "student-2-3-tomcat-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = 8080
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 6
    matcher             = "200"
  }
}

