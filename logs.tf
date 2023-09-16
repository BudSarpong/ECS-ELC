# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "ELC_log_group" {
  name              = "/ecs/myapp"
  retention_in_days = 30




  tags = {
    Name = "${var.project_name}-log-group"
  }


}


resource "aws_cloudwatch_log_stream" "ELC_log_stream" {
  name           = "ELC-log-stream"
  log_group_name = aws_cloudwatch_log_group.ELC_log_group.name
}