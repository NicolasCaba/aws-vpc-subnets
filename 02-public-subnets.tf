# Creacion de 3 subredes publicas dentro de la vpc

# Definicion de valores a utilizar para las subredes
locals {
  public_subnets = {
    "subred_1a" = {
      name       = "subred-nicolas-public-1a",
      cidr_block = "172.31.0.0/20",
      zone       = "us-east-1a"
    }

    "subred_1b" = {
      name       = "subred-nicolas-public-1b",
      cidr_block = "172.31.16.0/20",
      zone       = "us-east-1b"
    }

    "subred_1c" = {
      name       = "subred-nicolas-public-1c",
      cidr_block = "172.31.32.0/20",
      zone       = "us-east-1c"
    }
  }
}

# Creacion subredes
resource "aws_subnet" "subnet_public" {
  # Ciclo for_each
  for_each = local.public_subnets

  # Con each.value. accedemos a cada uno valores de la iteración
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.zone
  map_public_ip_on_launch = true


  tags = {
    "Name"    = each.value.name
    "Private" = "false"
  }
}
