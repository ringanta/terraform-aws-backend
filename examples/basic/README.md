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
