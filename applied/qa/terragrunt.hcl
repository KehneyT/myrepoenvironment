remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "remote-backend-bucket1" #"${get_aws_account_id()}-terraform-state-file"
    key            = "${path_relative_to_include()}/terraform.tfstate" #this will default back to iam terraform tf state , s3 tf state etc so that each of the key will start with iam.tf state
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "remote-terraform_lock"
  }
}
