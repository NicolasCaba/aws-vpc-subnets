/****************************************************/
# Credenciales AWS
/****************************************************/


/****************************************************/
# variables vpc
/****************************************************/
variable "vpc_cidr" {
  type        = string
  description = "CIDR IPv4 para la vpc"
}

variable "vpc_instance_tenancy" {
  type        = string
  description = "Tenencia de los componentes que se despliegan en la vpc"
}

variable "vpc_enable_dns_hostname" {
  type        = bool
  description = "Habilitar dns hostname para la vpc"
}

variable "vpc_enable_dns_support" {
  type        = bool
  description = "Habilitar soporte dns dentro de la vpc"
}

variable "vpc_name" {
  type        = string
  description = "Tag 'Name' de la vpc"
}

