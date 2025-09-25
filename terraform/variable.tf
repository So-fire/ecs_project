variable "region" {
  default = "us-east-1"
}

variable "ENV" {
  type    = string
  default = "dev"
}
variable "github_org" {
  type    = string
  default = "So-fire"  
  
}
variable "github_repo" {
  type    = string
  default = "ecs_project"  
}


variable "environment" {
  description = "Environment name"
  type        =  string
  default     =  "Dev"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "ecs_project"
}

variable "default_route" {
  description = "default"
  type        = string
  default     = "0.0.0.0/0"
}

###=============================================
#  VPC CIDR BLOCK VARIABLES
###============================================
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}