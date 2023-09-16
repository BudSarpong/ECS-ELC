#Security Groups

# ALB Security Group: Edit to restrict access to the application

resource "aws_security_group" "ELC-LB_SG" {
  name        = "ELC-LB_SG"
  description = "Security-group"
  vpc_id      = aws_vpc.VPC.id


  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "HTTP"
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
    Name = "${var.project_name}-LB-SG"
  }
}


#RDS Security Group: Edit to restrict access to the application

resource "aws_security_group" "ELC-RDS_SG" {

  name        = "ELC-RDS_SG"
  description = "Security-group"
  vpc_id      = aws_vpc.VPC.id


  ingress {
    description = "SSH"
    from_port   = 5432
    to_port     = 5432
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
    Name = "${var.project_name}-RDS-SG"
  }

}



# Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ECL-ecs_tasks-sg" {
  name        = "ECL-task-sg"
  description = "allow inbound access from the ALB only"
  vpc_id      = aws_vpc.VPC.id

  ingress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    security_groups = [aws_security_group.ELC-LB_SG.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project_name}-ecs-SG"
  }
}









