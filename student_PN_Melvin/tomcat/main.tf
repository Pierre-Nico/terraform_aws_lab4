data "aws_ami" "tomcat_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["bitnami-tomcat-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["979382823631"]
}

resource "aws_instance" "tomcat_instance" {
  ami           = data.aws_ami.tomcat_ami.id
  instance_type = "t2.micro"
  subnet_id     = element(var.subnet_ids, 0)
  security_groups = [var.security_group_id]

  tags = {
    Name = "TomcatInstance"
  }
}
resource "aws_lb_target_group_attachment" "tomcat_tg_attachment" {
  target_group_arn = var.tomcat_target_group_arn 
  target_id        = aws_instance.tomcat_instance.id
  port             = 8080
}
