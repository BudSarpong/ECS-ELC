

# ecs.tf

resource "aws_ecs_cluster" "ELC-cluster" {
  name = "ELC-cluster"
}

data "template_file" "ELC-template" {
  template = file("./templates/ecs/myapp.json.tpl")

  vars = {
    app_image      = var.app_image
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
  }
}

resource "aws_ecs_task_definition" "ELC" {
  family                   = "ELC-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.ELC-template.rendered
}

resource "aws_ecs_service" "ELC-service" {
  name            = "ELC-service"
  cluster         = aws_ecs_cluster.ELC-cluster.id
  task_definition = aws_ecs_task_definition.ELC.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ECL-ecs_tasks-sg.id]
    subnets          = aws_subnet.private_subnets.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.alb_target_group.id
    container_name   = "ELC"
    container_port   = var.app_port
  }

  depends_on = [aws_lb_listener.alb_http_listener, aws_iam_role_policy_attachment.ecs_task_execution_role]
}




