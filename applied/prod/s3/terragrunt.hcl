terraform {
  source = "../../..//infrastructure/region/s3" 
}


include "root" {
  path = find_in_parent_folders()
}