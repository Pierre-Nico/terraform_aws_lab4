data "aws_ami" "nginx" {
  most_recent = true
  filter {
    name   = "name"
    values = ["bitnami-nginx-1.23.3*"]
  }
  owners = ["979382823631"]
}

resource "aws_instance" "nginx_instance" {
  ami           = data.aws_ami.nginx.id
  instance_type = "t2.micro"
  subnet_id     = element(var.subnet_ids, 0)
  security_groups = [var.security_group_id]

  tags = {
    Name = "NginxInstance"
  }
}

resource "aws_lb_target_group_attachment" "nginx_tg_attachment" {
  target_group_arn = var.nginx_target_group_arn
  target_id        = aws_instance.nginx_instance.id
  port             = 80 
}
