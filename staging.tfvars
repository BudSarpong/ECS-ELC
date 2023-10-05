aws_region = "us-west-1" 
environment = "staging"
project_name = "staging-ELC" 
vpc_cidr = "10.0.0.0/16" 
instance_tenancy = "default" 
enable_dns_hostnames = "true" 
enable_dns_support = "true" 

map_public_ip_on_launch = "true" 



public_subnets_cidrs=["10.0.11.0/24", "10.0.12.0/24"]


private_subnets_cidrs = ["10.0.3.0/24", "10.0.14.0/24"]


azs = ["eu-west-1a", "us-west-1b"]


Public_subnets_name = ["ELC-Public-subnet-1", "ELC-Public-subnet-2"]


Private_subnets_name = ["ELC-Private-subnet-1", "ELC-Private-subnet-2"]


app_image = "public.ecr.aws/i5s4w7x5/yaw2:latest"


app_port    = 80



fargate_cpu    = "1024"


fargate_memory     = "2048"

health_check_path = "/"


ecs_task_execution_role_name     = "ECLtaskER"

app_count  = 4


certificate_arn     = "aws_acm_certificate.acm_certificate.arn"



db_password = "finalprojectpw"


db_username = "finalprojectun"


engine_version = "15.3"


engine = "postgres"


allocated_storage = 5


instance_class = "db.t3.micro"

