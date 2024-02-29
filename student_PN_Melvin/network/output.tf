output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "public_subnet_id_a" {
  value = aws_subnet.public_a.id
}

output "public_subnet_id_b" {
  value = aws_subnet.public_b.id
}


