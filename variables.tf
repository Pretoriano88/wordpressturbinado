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

// Variaveis das EC2
variable "ami_image" {
  description = "Imagem da ami que a instancia rodara "
  type        = string
  default     = "ami-04505e74c0741db8d"

}

variable "type_instance" {
  description = "O tipo da instancia"
  type        = string
  default     = "t2.nano"

}


// Variaveis do rds

variable "allo_stora" {
  description = "Irá  alocar espaço de armazenamento"
  type        = number
  default     = 10

}

variable "dbname" {
  description = "Será o nome do banco"
  type        = string
  default     = "bdwordpress"

}
variable "engine" {
  description = "Engine do banco"
  type        = string
  default     = "mysql"

}
variable "v_engine" {
  description = "Versão da engine"
  type        = string
  default     = "8.0"
}
variable "classinstance" {
  description = "A classe da maquina que irá rodar o bd"
  type        = string
  default     = "db.t3.micro"
}
variable "user" {
  description = "Username do bd"
  type        = string
  default     = "elfos"

}
variable "password" {
  description = "Sera o password para acessar o bd"
  type        = string
  default     = "elfos123"


}
variable "parameter_group_name" {
  type    = string
  default = "default.mysql8.0"
}

variable "port" {
  description = "Porta que irá ser aberto do rds"
  type        = number
  default     = 3306

}