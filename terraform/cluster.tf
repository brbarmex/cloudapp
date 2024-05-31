resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("./id_rsa.pub")
}

resource "aws_instance" "web" {
  ami             = "ami-0632bbd74ce561b38"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.pub_subnet_az_1a.id
  security_groups = [aws_security_group.allow_ssh.id]
  key_name        = aws_key_pair.deployer.key_name

  depends_on = [
    aws_subnet.pub_subnet_az_1a,
    aws_security_group.allow_ssh
  ]

  tags = merge(local.tags, {
    Name = "web_instance"
  })
}