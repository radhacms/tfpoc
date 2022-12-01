variable "project" {
  description = "The name of the project"
}

variable "environment" {
  description = "The deployment environment"
}

variable "vpc_security_group_ids" {
 type = list(any)
}

variable "public_subnet_id" {
 description = "public subnet id"
}
