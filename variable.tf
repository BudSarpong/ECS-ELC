

variable "aws_region" { }
variable "environment" {}
variable "project_name" { }
variable "vpc_cidr" { }
variable "instance_tenancy" {  }
variable "enable_dns_hostnames" {  }
variable "enable_dns_support" { }

variable "map_public_ip_on_launch" {  }



variable "public_subnets_cidrs" {}

variable "private_subnets_cidrs" {}

variable "azs" {}

variable "Public_subnets_name" {}

variable "Private_subnets_name" {}


variable "app_image" {}

variable "app_port" {}



variable "fargate_cpu" {}

variable "fargate_memory" {}
variable "health_check_path" {}

variable "ecs_task_execution_role_name" {}

variable "app_count" {}

variable "certificate_arn" {}


variable "db_password" {}

variable "db_username" {}

variable "engine_version" {}

variable "engine" {}

variable "allocated_storage" {}

variable "instance_class" {}






/*variable "region" { default = "us-west-1" }
variable "project_name" { default = "ELC" }
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "instance_tenancy" { default = "default" }
variable "enable_dns_hostnames" { default = "true" }
variable "enable_dns_support" { default = "true" }

variable "map_public_ip_on_launch" { default = "true" }



variable "public_subnets_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  default = ["us-west-1a", "us-west-1b"]
}

variable "Public_subnets_name" {
  default = ["ELC-Public-subnet-1", "ELC-Public-subnet-2"]
}

variable "Private_subnets_name" {
  default = ["ELC-Private-subnet-1", "ELC-Private-subnet-2"]
}


variable "app_image" {
  description = "nginx latest from aws ecr"
  default     = "public.ecr.aws/i5s4w7x5/yaw2:latest"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}


variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}
variable "health_check_path" {
  default = "/"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "ECLtaskER"
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 4
}

variable "certificate_arn" {
  description = "certificate arn"
  default     = "aws_acm_certificate.acm_certificate.arn"
}


variable "db_password" {
  default = "finalprojectpw"
}

variable "db_username" {
  default = "finalprojectun"
}

variable "engine_version" {
  default = "15.3"
}

variable "engine" {
  default = "postgres"
}

variable "allocated_storage" {
  default = 5
}

variable "instance_class" {
  default = "db.t3.micro"
}*/


