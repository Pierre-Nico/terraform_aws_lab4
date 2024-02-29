resource "aws_lb" "app_lb" {
  name               = "alb-student-2-3"
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups    = [var.alb_security_group_id]

  enable_deletion_protection = false
}

resource "aws_lb_listener" "http_front_end" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404 Not Found"
      status_code  = "404"
    }
  }
}



resource "aws_lb_listener_rule" "nginx" {
  listener_arn = aws_lb_listener.http_front_end.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = var.nginx_target_group_arn
  }

  condition {
    path_pattern {
      values = ["/nginx/*"]
    }
  }
}

resource "aws_lb_listener_rule" "tomcat" {
  listener_arn = aws_lb_listener.http_front_end.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = var.tomcat_target_group_arn
  }

  condition {
    path_pattern {
      values = ["/tomcat/*"]
    }
  }
}

