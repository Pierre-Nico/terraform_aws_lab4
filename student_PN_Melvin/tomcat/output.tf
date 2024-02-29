output "tomcat_instance_id" {
  value = aws_instance.tomcat_instance.id
}

output "tomcat_instance_public_ip" {
  value = aws_instance.tomcat_instance.public_ip
}
