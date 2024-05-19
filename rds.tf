resource "aws_db_instance" "default" {
  allocated_storage    = var.allo_stora
  db_name              = var.dbname
  engine               = var.engine
  engine_version       = var.v.engine
  instance_class       = var.classinstance
  username             = var.user
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
  // security e subnet groups que irá pertencer 
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group
  vpc_security_group_ids = aws_security_group_rule.rds_acess.ipv6_cidr_blocks
 


  # Certificando que as alterações manuais de senha rds sejam ignoradas
  lifecycle {
    ignore_changes = [password]
  }
}