// Internet gateway 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mainvpc.id


  tags = {
    Name = "IGWmain"
  }
}

# Criação da tabela de roteamento para as subnets públicas
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.mainvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

// Criação da tabela de roteamento para as subnets privadas 
/*resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.mainvpc.id

  route {
    cidr_block = var.vpc_cidr
  }

}*/

# Associação da tabela de roteamento às subnets públicas
resource "aws_route_table_association" "public_subnet_association_1a" {
  subnet_id      = aws_subnet.subnet-public-1a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_association_1b" {
  subnet_id      = aws_subnet.subnet-public-1b.id
  route_table_id = aws_route_table.public_route_table.id
}
