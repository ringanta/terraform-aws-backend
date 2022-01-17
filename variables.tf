variable "name" {
  description = "Name of the S3 bucket that will be created for Terraform backend"
  type        = string

  validation {
    condition     = length(var.name) >= 3 && length(var.name) <= 58
    error_message = "Bucket name must be between 3 and 58 characters long."
  }
}

variable "key_alias" {
  description = "Alias for the KMS main key"
  type        = string
  default     = "terraform_s3_backend"
}

variable "tags" {
  description = "Additional tags that will be added to AWS resources created by this module"
  type        = map(any)
  default     = {}
}

variable "create_iam_policy" {
  description = "Flag to decided whether to create IAM Policy that have full access to Terraform S3 backend resources"
  type        = bool
  default     = true
}

variable "iam_policy_name" {
  description = "Name of IAM Policy that has full access to all resources"
  type        = string
  default     = "TerraformS3BackendFullAccess"
}