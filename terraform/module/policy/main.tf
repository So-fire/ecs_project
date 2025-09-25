# =================================================================
# Policy for GitHub OIDC Deployments
# Grants Terraform permissions to manage 3-tier infra (network, db, ecs, secrets, etc.)
# =================================================================
resource "aws_iam_policy" "oidc_deployment_policy" {
  name        = "${var.RESOURCES_PREFIX}_OIDCDeploymentPolicy"
  description = "Allows GitHub OIDC role to deploy 3-tier web app infrastructure (VPC, ECS, RDS, SGs, Secrets, ECR, etc.)"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # VPC & Networking
      {
        Effect   = "Allow"
        Action   = [
          "ec2:*Vpc*",
          "ec2:*Subnet*",
          "ec2:*Route*",
          "ec2:*RouteTable*",
          "ec2:*InternetGateway*",
          "ec2:*NatGateway*",
          "ec2:*SecurityGroup*",
          "ec2:Describe*",
          "ec2:CreateTags",
          "ec2:DeleteTags"
        ]
        Resource = "*"
      },

      # ECS + ECR
      {
        Effect   = "Allow"
        Action   = [
          "ecs:*",
          "elasticloadbalancing:*",
          "application-autoscaling:*",
          "ecr:*"
        ]
        Resource = "*"
      },

      # RDS
      {
        Effect   = "Allow"
        Action   = [
          "rds:*",
          "rds-db:*"
        ]
        Resource = "*"
      },

      # Secrets Manager & SSM
      {
        Effect   = "Allow"
        Action   = [
          "secretsmanager:*",
          "ssm:*",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:GenerateDataKey",
          "kms:DescribeKey"
        ]
        Resource = "*"
      },

      # IAM (limited to role + policy management for OIDC)
      {
        Effect   = "Allow"
        Action   = [
          "iam:PassRole",
          "iam:GetRole",
          "iam:CreateRole",
          "iam:DeleteRole",
          "iam:AttachRolePolicy",
          "iam:DetachRolePolicy",
          "iam:PutRolePolicy",
          "iam:DeleteRolePolicy"
        ]
        Resource = "*"
      },

      # CloudWatch Logs (for ECS/RDS/ALB logging)
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Resource = "*"
      },

      # S3 (for app artifacts / state files if needed)
      {
        Effect   = "Allow"
        Action   = [
          "s3:*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "oidc_attachment" {
  role       = var.OIDC_ROLE_NAME
  policy_arn = aws_iam_policy.oidc_deployment_policy.arn
}

