variable "name" {
  description = "Name of the S3 bucket that will be created for Terraform backend"
  type        = string

  validation {
    condition     = length(var.name) >= 3 && length(var.name) <= 58
    error_message = "Bucket name must be between 3 and 58 characters long."
  }
}

variable "tags" {
  description = "Additional tags that will be added to AWS resources created by this module"
  type        = map(any)
  default     = {}
}
