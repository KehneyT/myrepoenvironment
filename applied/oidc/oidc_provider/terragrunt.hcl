terraform {
  source = "../../..//modules/oidc_provider" 
}


include "root" {
  path = find_in_parent_folders()
}