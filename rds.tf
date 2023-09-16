
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "elc"
  subnet_ids = [aws_subnet.private_subnets[1].id, aws_subnet.private_subnets[0].id]

  tags = {
    Name = "${var.project_name}-db_subnet_group"
  }
}


resource "aws_db_parameter_group" "database_parameter_group" {
  name   = "elc"
  family = "postgres15"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

#RDS Postgres Instance
resource "aws_db_instance" "db_instsnce_ELC" {
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.ELC-RDS_SG.id]
  publicly_accessible    = true
  skip_final_snapshot    = true
}
