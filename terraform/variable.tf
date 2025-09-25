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