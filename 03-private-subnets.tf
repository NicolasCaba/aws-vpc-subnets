# Creacion de 3 subredes privadas dentro de la vpc

# Definicion de los valores a utilizar para las subredes
locals {
  private_subnets = {
    "subred_1a" = {
      name       = "subred-nicolas-private-1a"
      cidr_block = "172.31.48.0/20"
      zone       = "us-east-1a"
    }

    "subred_1b" = {
      name       = "subred-nicolas-private-1b"
      cidr_block = "172.31.64.0/20"
      zone       = "us-east-1b"
    }

    "subred_1c" = {
      name       = "subred-nicolas-private-1c"
      cidr_block = "172.31.80.0/20"
      zone       = "us-east-1c"
    }
  }
}

# Creacion subredes
resource "aws_subnet" "subnet_private" {
  # Ciclo for_each
  for_each = local.private_subnets

  # Con each.value. accedemos a cada uno de los valores de la iteración
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.zone
  map_public_ip_on_launch = false

  tags = {
    "Name"    = each.value.name
    "Private" = "true"
  }
}
