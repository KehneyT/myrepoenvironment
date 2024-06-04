terraform {
  source = "../../..//modules/oidc_proxy" 
}


include "root" {
  path = find_in_parent_folders()
}