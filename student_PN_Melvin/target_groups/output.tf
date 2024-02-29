output "nginx_target_group_arn" {
  value = aws_lb_target_group.nginx.arn
}

output "tomcat_target_group_arn" {
  value = aws_lb_target_group.tomcat.arn
}
