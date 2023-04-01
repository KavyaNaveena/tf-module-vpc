resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = merge(
    var.tags,
    { Name = "${var.env}-vpc" }
  )
}

## public subnets
resource "aws_subnet" "main" {
  vpc_id = aws_vpc.main.id

  for_each          = var.public_subnets
  cidr_block        = each.value["cidr_block"][0] + each.value["cidr_block"][1]
  availability_zone = each.value["availability_zone"][0]+each.value["availability_zone"][1]
  tags = {
    name = each.value["name"][0] + each.value["name"][1]
  }
}