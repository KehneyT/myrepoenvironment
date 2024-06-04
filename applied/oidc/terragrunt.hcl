remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "366175039735-terraform-state-file"        #"${get_aws_account_id()}-terraform-state-file"
    key            = "${path_relative_to_include()}/terraform.tfstate" #this will default back to iam terraform tf state , s3 tf state etc so that each of the key will start with iam.tf state
    region         =  "us-east-1" #local.${region}
    encrypt        = true
    dynamodb_table = "remote-terraform-lock-config-11"
  }
}