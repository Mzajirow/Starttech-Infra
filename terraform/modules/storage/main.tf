resource "aws_s3_bucket" "frontend" {
  bucket = "${var.project_name}-frontend-bucket2503"
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.frontend.id

  index_document {
    suffix = "index.html"
  }
}