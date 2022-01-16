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
