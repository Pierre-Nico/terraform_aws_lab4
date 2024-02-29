output "nginx_instance_id" {
  value = aws_instance.nginx_instance.id
}

output "nginx_instance_public_ip" {
  value = aws_instance.nginx_instance.public_ip
}
