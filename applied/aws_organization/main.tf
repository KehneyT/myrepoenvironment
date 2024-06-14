resource "aws_fms_administrator" "fms_admin_account" {
  account_id        = "123456789012" #replace with the delegated account number
  service_principal = "fms"
}


resource "aws_organizations_organization" "org" {
  aws_service_access_principals = [
    "fms.amazonaws.com",
    "config.amazonaws.com",
  ]

  feature_set = "ALL"
}


