// Informando para o terraform onde o arquivo da chave publica estará
// ssh-keygen com esse comando será criada uma chave publica 
resource "aws_key_pair" "keypair" {
  key_name   = "terraform-kaypair"
  public_key = file("~/.ssh/id_rsa.pub")

}

resource "aws_instance" "servidor" {
  ami           = var.ami_image
  instance_type = var.type_instance

  // Amarrando a instancia EC2 a subnet  
  subnet_id = aws_subnet.subnet-public-1a.id

  // Qual security group minha instancia ficará 
  vpc_security_group_ids = [aws_security_group.securitygroupEC2.id]

  // Usando user data para subir antes da instancia 
  user_data = templatefile("ec2wordpress.sh", {
    wp_db_name       = aws_db_instance.default.db_name
    wp_username      = aws_db_instance.default.username
    wp_user_password = aws_db_instance.default.password
    wp_db_host       = aws_db_instance.default.address
  })

  // Amarrando a keypair acima a instancia ec2 
  key_name = aws_key_pair.keypair.key_name


  tags = {
    Name = "EC2 que rodará wordpress"
  }


}


# Arquivo com os dados de criação da instância ec2 para monitoramento com prometheus+grafana

resource "aws_instance" "monitor" {
  ami                         = var.ami_image
  instance_type               = var.type_instance
  vpc_security_group_ids      = [aws_security_group.allow_monitor.id]
  key_name                    = aws_key_pair.keypair.key_name
  user_data                   = base64encode(templatefile("monitor_config.sh",  {}))
  monitoring                  = true
  subnet_id                   = aws_subnet.subnet-public-1a.id
  associate_public_ip_address = true
  tags                        = merge(local.common_tags, { Name = "Monitor Machine" })

}