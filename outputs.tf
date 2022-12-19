/********************************************/
# Outputs vpc
/********************************************/
output "vpc-id" {
  description = "Mostrar id de la vpc"
  value       = aws_vpc.vpc.id
}

output "vpc-name" {
  description = "Mostrar nombre de vpc"
  value       = aws_vpc.vpc.tags.Name
}

output "vpc-cidr" {
  description = "Mostrar bloque CIDR de la vpc"
  value       = aws_vpc.vpc.cidr_block
}


/********************************************/
# Outputs public subnets
/********************************************/
output "public-subnets" {
  description = "Mostrar id y nombre de las subredes publicas"
  value = { for v, subnet in aws_subnet.subnet_public : v => {
    subnet_id   = subnet.id,
    subnet_name = subnet.tags.Name
    }
  }
}

/********************************************/
# Outputs private subnets
/********************************************/
output "private-subnets" {
  description = "Mostrar id y nombre de las subredes privadas"
  value = { for v, subnet in aws_subnet.subnet_private : v => {
    subnet_id   = subnet.id,
    subnet_name = subnet.tags.Name
    }
  }
}