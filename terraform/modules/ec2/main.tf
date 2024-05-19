resource "aws_instance" "ec2" {
  ami = var.ami
  availability_zone = var.availability_zone
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  #security_groups = var.security_group
  tags = var.tags
}