output "bucket_name" {
  description = "Name of the S3 bucket for the Terraform backend"
  value       = module.s3_backend.bucket_name
}

output "table_name" {
  description = "DynamoDB table name for the Terraform backend lock"
  value       = module.s3_backend.table_name
}

output "key_arn" {
  description = "ARN of the KMS main key"
  value       = module.s3_backend.key_arn
}

output "key_alias_arn" {
  description = "ARN of the alias for the KMS main key"
  value       = module.s3_backend.key_alias_arn
}

output "iam_policy_arn" {
  description = "ARN of IAM Policy that have full access to use the Terraform S3 backend"
  value       = module.s3_backend.iam_policy_arn
}

output "iam_policy_json" {
  description = "Content (in JSON format) of IAM Policy that have full access to the Terraform S3 backend"
  value       = module.s3_backend.iam_policy_json
}

output "s3_backend_sample_config" {
  description = "Example configuration to use this S3 backend"
  value       = module.s3_backend.s3_backend_sample_config
}
