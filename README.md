# Terraform Module S3 Backend

Terraform module to provision AWS resources to be used as backend for Terraform remote state.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.72.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_iam_policy_document.deny_unencrypted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_alias"></a> [key\_alias](#input\_key\_alias) | Alias for the KMS main key | `string` | `"terraform_s3_backend"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the S3 bucket that will be created for Terraform backend | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags that will be added to AWS resources created by this module | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Name of the S3 bucket for the Terraform backend |
| <a name="output_key_alias_arn"></a> [key\_alias\_arn](#output\_key\_alias\_arn) | ARN of the alias for the KMS main key |
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | ARN of the KMS main key |
| <a name="output_table_name"></a> [table\_name](#output\_table\_name) | DynamoDB table name for the Terraform backend lock |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
