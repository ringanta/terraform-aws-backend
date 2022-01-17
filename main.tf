locals {
  bucket_name            = var.name
  table_name             = "${local.bucket_name}-lock"
  module_registry_bucket = var.module_registry_bucket == null ? "${var.name}-registry" : var.module_registry_bucket

  default_tags = {
    ManagedBy = "terraform"
  }
}

data "aws_region" "this" {}

# tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name
  policy = data.aws_iam_policy_document.deny_unencrypted.json

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = merge(local.default_tags, var.tags)
}

data "aws_iam_policy_document" "deny_unencrypted" {
  statement {
    sid = "DenyIncorrectEncryptionHeader"

    effect = "Deny"

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}/*",
    ]

    condition {
      test     = "StringNotEquals"
      variable = "s3:x-amz-server-side-encryption"

      values = [
        "AES256",
        "aws:kms"
      ]
    }
  }

  statement {
    sid = "DenyUnEncryptedObjectUploads"

    effect = "Deny"

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}/*",
    ]

    condition {
      test     = "Null"
      variable = "s3:x-amz-server-side-encryption"

      values = [
        "true"
      ]
    }
  }

  statement {
    sid = "EnforceTlsRequestsOnly"

    effect = "Deny"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = ["s3:*"]

    resources = [
      "arn:aws:s3:::${local.bucket_name}",
      "arn:aws:s3:::${local.bucket_name}/*",
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "this" {
  name           = local.table_name
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  server_side_encryption {
    enabled = true
  }

  tags = merge(local.default_tags, var.tags)
}

resource "aws_kms_key" "this" {
  description             = "Terraform S3 backend main key"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  tags = merge(local.default_tags, var.tags)
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.key_alias}"
  target_key_id = aws_kms_key.this.id
}

data "aws_iam_policy_document" "this" {
  statement {
    sid = "AllowListBucket"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.this.arn,
    ]
  }

  statement {
    sid = "AllowRWBucketObject"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:GetObjectTagging",
      "s3:PutObjectTagging",
      "s3:DeleteObjectTagging",
    ]

    resources = [
      "${aws_s3_bucket.this.arn}/*",
    ]
  }

  statement {
    sid = "AllowRWDynamoDBTable"

    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
    ]

    resources = [
      aws_dynamodb_table.this.arn,
    ]
  }

  statement {
    sid = "AllowEncryptDecryptKMS"

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:GenerateDataKey",
    ]

    resources = [
      aws_kms_key.this.arn,
      aws_kms_alias.this.arn,
    ]
  }
}

resource "aws_s3_bucket" "module_registry" {
  count = var.create_module_registry_bucket ? 1 : 0

  bucket = local.module_registry_bucket
  policy = data.aws_iam_policy_document.deny_unencrypted_request[0].json

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = merge(local.default_tags, var.tags)
}

resource "aws_s3_bucket_public_access_block" "module_registry" {
  count = var.create_module_registry_bucket ? 1 : 0

  bucket                  = aws_s3_bucket.module_registry[0].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "deny_unencrypted_request" {
  count = var.create_module_registry_bucket ? 1 : 0

  statement {
    sid = "EnforceTlsRequestsOnly"

    effect = "Deny"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = ["s3:*"]

    resources = [
      "arn:aws:s3:::${local.module_registry_bucket}",
      "arn:aws:s3:::${local.module_registry_bucket}/*",
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

data "aws_iam_policy_document" "module_registry" {
  count = var.create_module_registry_bucket ? 1 : 0

  statement {
    sid = "AllowListBucketModuleRegistry"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${local.module_registry_bucket}",
    ]
  }

  statement {
    sid = "AllowRWBucketObjectModuleRegistry"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:GetObjectTagging",
      "s3:PutObjectTagging",
      "s3:DeleteObjectTagging",
    ]

    resources = [
      "arn:aws:s3:::${local.module_registry_bucket}/*",
    ]
  }
}

data "aws_iam_policy_document" "combined" {
  count = var.create_module_registry_bucket ? 1 : 0

  source_policy_documents = [
    data.aws_iam_policy_document.this.json,
    data.aws_iam_policy_document.module_registry[0].json,
  ]
}

resource "aws_iam_policy" "this" {
  count = var.create_iam_policy ? 1 : 0

  name   = var.iam_policy_name
  policy = var.create_module_registry_bucket ? data.aws_iam_policy_document.combined[0].json : data.aws_iam_policy_document.this.json
}
