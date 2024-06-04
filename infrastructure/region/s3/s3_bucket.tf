module "s3_bucket"  {
    source = "../../..//modules/s3"
    
    region = "us-east-1"
    bucket_name = "devsec-bucket1"
}


# To create multiple buckets ,change the name.