# =================================================================
# OIDC  ROLE
# =================================================================
output "OIDC_ROLE_ARN" {
  value = aws_iam_role.oidc_role.arn
}
output "OIDC_ROLE_NAME" {
  value = aws_iam_role.oidc_role.name
}
