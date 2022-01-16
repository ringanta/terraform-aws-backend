output "bucket_name" {
    description = "Name of the S3 bucket for the Terraform backend"
    value = aws_s3_bucket.this.id
}

output "table_name" {
    description = "DynamoDB table name for the Terraform backend lock"
    value = aws_dynamodb_table.this.name
}

