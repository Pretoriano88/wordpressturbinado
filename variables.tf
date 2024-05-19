variable "region" {
  default = "us-east-1"
}


variable "vpc_cidr" {
  description = "cidr da vpc"
  default     = "10.0.0.0/16"

}

variable "public_onlaunch" {
  description = "se irá atribuir ip publico"
  type        = bool
  default     = true
}

// Variaveis do rds

variable "allo_stora" {
  description = "Irá  alocar espaço de armazenamento"
  type = number
  default = 10

}

variable "dbname" {
  description = "Será o nome do banco"
  type = string
  default = "bdwordpress"
  
}
variable "engine" {
  description = "Engine do banco"
  type = string
  default = "mysql"
  
}
variable "v.engine" {
  description = "Versão da engine"
  type = string
  default = "8.0"
}
variable "classinstance" {
  description = "A classe da maquina que irá rodar o bd"
  type = string  
  default = "db.t3.micro"  
}
variable "user" {
  description = "Username do bd" 
  type = string
  default = "elfos"

}
variable "password" {
  description = "Sera o password para acessar o bd"
  type = string
  default = "elfos123"

  
}
variable "parameter_group_name" {
      type = string
      default = "default.mysql8.0"
}
