output "aws_region" {

  value = var.aws_region
}


output "project_name" {
  value = var.project_name
}
output "vpc_id" {
  value = aws_vpc.VPC.id
}
output "vpc_cidr" {
  value = var.vpc_cidr
}

output "instance_tenancy" {
  value = var.instance_tenancy
}

output "map_public_ip_on_launch" {
  value = var.map_public_ip_on_launch
}

output "db_password" {
  value = var.db_password
}
output "db_username" {
 value = var.db_username
}
output "engine_version" {
  value = var.engine_version
}

output "engine" {
  value = var.engine
}











































/*resource "aws_ecs_cluster" "foo" {
  name = "white-hart"

  
}

data "template_file" "init" {
  template = "${file("${path.module}/init.tpl")}"
  vars = {
    app_image=nginx
    app_port=80
    fargate_cpu=1024
    fargate_memory=2048
    aws_region=us-west-1
  }
}

resource "aws_ecs_task_definition" "test" {
  family                   = "test"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
 execution_role_arn =
  memory                   = 2048
  container_definitions    =
}

resource "aws_ecs_service" "mongo" {
  name            = "mongodb"
  cluster         = aws_ecs_cluster.foo.id
  task_definition = aws_ecs_task_definition.mongo.arn
  desired_count   = 3
  iam_role        = aws_iam_role.foo.arn
  depends_on      = [aws_iam_role_policy.foo]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.foo.arn
    container_name   = "mongo"
    container_port   = 8080
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }
}*/