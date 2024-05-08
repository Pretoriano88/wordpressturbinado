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