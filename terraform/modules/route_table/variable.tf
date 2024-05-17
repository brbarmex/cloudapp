variable "vpc_id" {}

variable "tags" {
  type = map(string)
}

variable "routes" {
  type = list(object({
    cidr_block = string
  }))
}

variable "subnet_ids" {
  type = list(string)
}