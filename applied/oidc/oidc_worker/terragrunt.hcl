terraform {
  source = "../../..//modules/oidc_worker" 
}


include "root" {
  path = find_in_parent_folders()
}

inputs = {
    proxy_role = "github_action_proxy"
    account_id = "366175039735"
    worker_role = "github_action_worker_role"
    worker_role_policy_name = "github_action_worker_policy"
}