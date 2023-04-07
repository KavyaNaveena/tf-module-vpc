output "public_subnets"{
  value = var.public_subnets
}

output "private_subnets" {
  value = var.private_subnets
}

output "vpc_id" {
  value = aws_vpc.main.id
}