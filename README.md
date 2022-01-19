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
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.module_registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.module_registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_iam_policy_document.combined](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.deny_unencrypted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.deny_unencrypted_request](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.module_registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_iam_policy"></a> [create\_iam\_policy](#input\_create\_iam\_policy) | Flag to decided whether to create IAM Policy that have full access to Terraform S3 backend resources | `bool` | `true` | no |
| <a name="input_create_module_registry_bucket"></a> [create\_module\_registry\_bucket](#input\_create\_module\_registry\_bucket) | Flag to decide whether to create S3 bucket for Terraform module private registry | `bool` | `false` | no |
| <a name="input_iam_policy_name"></a> [iam\_policy\_name](#input\_iam\_policy\_name) | Name of IAM Policy that has full access to all resources | `string` | `"TerraformS3BackendFullAccess"` | no |
| <a name="input_key_alias"></a> [key\_alias](#input\_key\_alias) | Alias for the KMS main key | `string` | `"terraform_s3_backend"` | no |
| <a name="input_module_registry_bucket"></a> [module\_registry\_bucket](#input\_module\_registry\_bucket) | Name of S3 bucket that will be created for the Terraform module private registry | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the S3 bucket that will be created for Terraform backend | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags that will be added to AWS resources created by this module | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN of the S3 bucket for the Terraform backend |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Name of the S3 bucket for the Terraform backend |
| <a name="output_iam_policy_arn"></a> [iam\_policy\_arn](#output\_iam\_policy\_arn) | ARN of IAM Policy that have full access to use the Terraform S3 backend |
| <a name="output_iam_policy_json"></a> [iam\_policy\_json](#output\_iam\_policy\_json) | Content (in JSON format) of IAM Policy that have full access to the Terraform S3 backend |
| <a name="output_key_alias_arn"></a> [key\_alias\_arn](#output\_key\_alias\_arn) | ARN of the alias for the KMS main key |
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | ARN of the KMS main key |
| <a name="output_module_registry_arn"></a> [module\_registry\_arn](#output\_module\_registry\_arn) | S3 Bucket ARN for the private module registry |
| <a name="output_module_registry_bucket"></a> [module\_registry\_bucket](#output\_module\_registry\_bucket) | S3 Bucket name for the private module registry |
| <a name="output_s3_backend_sample_config"></a> [s3\_backend\_sample\_config](#output\_s3\_backend\_sample\_config) | Example configuration to use this S3 backend |
| <a name="output_table_name"></a> [table\_name](#output\_table\_name) | DynamoDB table name for the Terraform backend lock |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

This module is managed by [Roy Ginting](https://github.com/ringanta)

## License

This module is licensed under Apache 2 license. See [LICENSE](https://github.com/ringanta/terraform-aws-backend/tree/master/LICENSE) file for full details.
