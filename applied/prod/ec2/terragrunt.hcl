terraform {
  source = "../../..//infrastructure/region/ec2" 
}


include "root" {
  path = find_in_parent_folders()
}