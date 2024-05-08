// Informando para o terraform onde o arquivo da chave publica estará
// ssh-keygen com esse comando será criada uma chave publica 
resource "aws_key_pair" "keypair" {
  key_name   = "terraform-kaypair"
  public_key = file("~/.ssh/id_rsa.pub")

}

resource "aws_instance" "servidor" {
  ami           = "ami-0a1179631ec8933d7"
  instance_type = "t2.nano"
  
  // Amarrando a instancia EC2 a subnet  
  subnet_id = aws_subnet.subnet-public-1a.id
 
 // Qual security group minha instancia ficará 
  vpc_security_group_ids = [aws_security_group.securitygroupEC2.id]
  
 // Usando user data para subir antes da instancia 
  user_data = file("user_data.sh")

 // Amarrando a keypair acima a instancia ec2 
  key_name = aws_key_pair.keypair.key_name

  depends_on = [aws_internet_gateway.gw]

  tags = {
    Name = "EC2 que rodará wordpress"
  }

 
}