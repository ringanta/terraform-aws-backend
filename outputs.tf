output "bucket_name" {
  description = "Name of the S3 bucket for the Terraform backend"
  value       = aws_s3_bucket.this.id
}

output "table_name" {
  description = "DynamoDB table name for the Terraform backend lock"
  value       = aws_dynamodb_table.this.name
}

output "key_arn" {
  description = "ARN of the KMS main key"
  value       = aws_kms_key.this.arn
}

output "key_alias_arn" {
  description = "ARN of the alias for the KMS main key"
  value       = aws_kms_alias.this.arn
}

output "iam_policy_arn" {
  description = "ARN of IAM Policy that have full access to use the Terraform S3 backend"
  value       = join("", aws_iam_policy.this.*.arn)
}

output "iam_policy_json" {
  description = "Content (in JSON format) of IAM Policy that have full access to the Terraform S3 backend"
  value       = data.aws_iam_policy_document.this.json
}

output "s3_backend_sample_config" {
  description = "Example configuration to use this S3 backend"
  value = templatefile("${path.module}/sample-config.tftpl", {
    bucket_name    = aws_s3_bucket.this.id
    region         = data.aws_region.this.name
    dynamodb_table = aws_dynamodb_table.this.name
    kms_key_alias  = aws_kms_alias.this.arn
  })
}
