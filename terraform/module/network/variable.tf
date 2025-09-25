variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}
variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "3-tier"
}
variable "default_route" {
  description = "default"
  type        = string
  default     = "0.0.0.0/0"
}