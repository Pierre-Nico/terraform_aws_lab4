resource "aws_subnet" "public_a" {
  vpc_id            = var.vpc_id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "student_2_3_Public_a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = var.vpc_id
  cidr_block        = "192.168.3.0/24"
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = "student_2_3_Public_b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id            = var.vpc_id
  cidr_block        = "192.168.103.0/24"
  availability_zone = "${var.aws_region}c"
  tags = {
    Name = "student_2_3_Public_c"
  }
}
