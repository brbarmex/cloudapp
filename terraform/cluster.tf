resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("./id_rsa.pub")
}

resource "aws_instance" "web" {
  ami             = "ami-0632bbd74ce561b38"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.pub_subnet_az_1a.id
  security_groups = [aws_security_group.web_sg.id]
  key_name        = aws_key_pair.deployer.key_name

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
    
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }    
  }

  depends_on = [
    aws_subnet.pub_subnet_az_1a,
    aws_security_group.web_sg
  ]

  tags = merge(local.tags, {
    Name = "web_instance"
  })
}

resource "aws_instance" "backend" {
  ami             = "ami-0632bbd74ce561b38"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.pvt_subnet_az_1a.id
  security_groups = [aws_security_group.internal_sg.id]
  key_name        = aws_key_pair.deployer.key_name

  depends_on = [
    aws_subnet.pvt_subnet_az_1a,
    aws_security_group.internal_sg
  ]

  tags = merge(local.tags, {
    Name = "backend_instance"
  })
}

resource "aws_instance" "database" {
  ami             = "ami-0632bbd74ce561b38"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.pvt_subnet_az_1b.id
  security_groups = [aws_security_group.internal_sg.id]
  key_name        = aws_key_pair.deployer.key_name

  depends_on = [
    aws_subnet.pvt_subnet_az_1b,
    aws_security_group.internal_sg
  ]

  tags = merge(local.tags, {
    Name = "database_instance"
  })
}