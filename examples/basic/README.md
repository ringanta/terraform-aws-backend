# Basic Usage S3 Backend

Demonstrate basic usage of the s3-backend Terraform module.

## Prerequisites

You need the following to run this project:

- [tfenv](https://github.com/tfutils/tfenv)
- Working AWS credential

## Setup

Follow the following steps to run the project:

1. Install required terraform version
   ```shell
   tfenv install min-required
   tfenv use min-required
   ```
1. Initialize terraform project
   ```shell
   terraform init
   ```
1. Generate and review execution plan
   ```shell
   terraform plan -out=tfplan.out
   ```
1. Apply the execution plan
   ```shell
   terraform apply tfplan.out
   ```

## Clean up

Should you want to clean up all resources created in this project, run the following:

1. Generate and review execution plan to destroy the resources
   ```shell
   terraform plan -destroy -out=tfplan.out
   ```
1. Apply the execution plan
   ```shell
   terraform apply tfplan.out
   ```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.72.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_backend"></a> [s3\_backend](#module\_s3\_backend) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Name of the S3 bucket for the Terraform backend |
| <a name="output_iam_policy_arn"></a> [iam\_policy\_arn](#output\_iam\_policy\_arn) | ARN of IAM Policy that have full access to use the Terraform S3 backend |
| <a name="output_iam_policy_json"></a> [iam\_policy\_json](#output\_iam\_policy\_json) | Content (in JSON format) of IAM Policy that have full access to the Terraform S3 backend |
| <a name="output_key_alias_arn"></a> [key\_alias\_arn](#output\_key\_alias\_arn) | ARN of the alias for the KMS main key |
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | ARN of the KMS main key |
| <a name="output_s3_backend_sample_config"></a> [s3\_backend\_sample\_config](#output\_s3\_backend\_sample\_config) | Example configuration to use this S3 backend |
| <a name="output_table_name"></a> [table\_name](#output\_table\_name) | DynamoDB table name for the Terraform backend lock |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
