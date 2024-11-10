resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}
 
output "bucket_name" {
value = aws_s3_bucket.lambda_bucket.id
}