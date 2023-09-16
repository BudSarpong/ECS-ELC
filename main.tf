resource "aws_vpc" "VPC" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = {
    Name = "${var.project_name}-vpc"
  }
}



#SUBNETS

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnets_cidrs)
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.public_subnets_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = var.Public_subnets_name[count.index]
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnets_cidrs)
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.private_subnets_cidrs[count.index]
  availability_zone = var.azs[count.index]
  tags = {
    Name = var.Private_subnets_name[count.index]
  }
}


#ROUTE-TABLES

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.VPC.id
  tags = {
    Name = "${var.project_name}-public_route"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "${var.project_name}-private_route"
  }
}
#ROUTE-TABLE-ASSOCIATIONS

resource "aws_route_table_association" "public-assosition" {
  count          = length(var.public_subnets_cidrs)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "private-association" {
  count          = length(var.private_subnets_cidrs)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route.id
}


#IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

#ROUTE-IGW

resource "aws_route" "route-igw" {
  route_table_id         = aws_route_table.public_route.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"


}

#EIP

resource "aws_eip" "elastic-eip" {

}

#NGW

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.elastic-eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "${var.project_name}-ngw"
  }

}









