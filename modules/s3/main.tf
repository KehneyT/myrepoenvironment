resource "aws_s3_bucket" "my-devsec-storage" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "my-devsec-storage" {
  bucket = aws_s3_bucket.my-devsec-storage.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my-devsec-storage" {
  bucket = aws_s3_bucket.my-devsec-storage.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256" #server-side encryption 
    }
  }
}