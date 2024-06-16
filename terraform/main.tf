resource "aws_security_group" "react_security_group" {
  name        = "react-security-group"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "react-security-group"
  }
}


resource "aws_instance" "react_server" {
  ami           = "ami-04b70fa74e45c3917" # Ubuntu AMI
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.react_security_group.id]
  user_data              = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo docker pull adil6572/react-app:latest
              sudo docker run -d -p 80:80 adil6572/react-app:latest
              EOF

  tags = {
    Name = var.instance_name
  }
}
