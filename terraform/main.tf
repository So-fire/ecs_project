locals {
  RESOURCES_PREFIX = "${lower(var.ENV)}-ecs_project"
  ACCOUNTID        = data.aws_caller_identity.current.account_id
  INFO_EMAIL       = "safespace196@gmail.com"

  common_tags = {
    environment = var.ENV
    project     = "ECS_PROJECT"
  }
}

# module "role" {
#   source           = "./module/role"
#   ENV              = var.ENV
#   AWS_REGION       = var.region
#   RESOURCES_PREFIX = local.RESOURCES_PREFIX
#   oidc_provider_arn = module.oidc.arn
#   github_org        = var.github_org
#   github_repo       = var.github_repo
# }

# module "policy" {
#   source           = "./module/policy"
#   ENV                                        = var.ENV
#   AWS_REGION                                 = var.region
#   RESOURCES_PREFIX                           = local.RESOURCES_PREFIX
#   CURRENT_ACCOUNT_ID                         = data.aws_caller_identity.current.account_id
#   OIDC_ROLE_NAME                             = module.role.OIDC_ROLE_NAME 
# }

# module "network" {
#   source = "./module/network"

#   default_route = var.default_route
#   project_name  = var.project_name
#   vpc_cidr      = var.vpc_cidr
#   environment   = var.environment
# }

# module "webapp_ecr" {
#   source          = "./module/ecr"
#   repo_name       = var.repo_name
# }

