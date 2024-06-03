terraform {
  source = "../../..//infrastructure/region/iam_group" 
}


include "root" {
  path = find_in_parent_folders()
}