
resource "aws_security_group" "securitygroupEC2" {
  name        = "securitygroup"
  description = "Permitir acesso http e acessoa a Internet EC2"
  vpc_id      = aws_vpc.mainvpc.id


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso SSH, HTTP"
  }
}

// Security group da ec2Wordpress poder acessar o RDS 
resource "aws_security_group_rule" "rds_acess" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 3306
  to_port                  = 3306
  security_group_id        = aws_security_group.securitygroupEC2.id
  source_security_group_id = aws_security_group.securitygroupEC2.id
}

# Security group monitor
resource "aws_security_group" "allow_monitor" {
  vpc_id = aws_vpc.mainvpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "GRAFANA"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "PROMETHEUS"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Prometheus+Grafana"
  }
}

