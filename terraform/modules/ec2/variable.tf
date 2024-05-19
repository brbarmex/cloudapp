variable "ami" {}

variable "availability_zone" {
  type = string
}

variable "instance_type" {
  type = string 
}

variable "subnet_id" {}
#variable "security_group" {}
variable "tags" {}