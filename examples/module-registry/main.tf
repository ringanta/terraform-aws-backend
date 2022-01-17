module "s3_backend" {
  source = "../.."

  name = "terraform-s3-backend-module-example"
  create_module_registry_bucket = true
  iam_policy_name = "TFS3BackendFullAccess"
  key_alias = "tf_s3_backend"
}
