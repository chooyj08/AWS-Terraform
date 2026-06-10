resource "aws_vpc" "mynet" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = "mynet"
  })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.mynet.id
  tags   = merge(var.tags, { Name = "mynet-igw" })
}
