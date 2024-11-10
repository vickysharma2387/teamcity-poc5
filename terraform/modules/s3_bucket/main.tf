resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.bucket_name
}
 
# Upload the Lambda code zip file to the S3 bucket
resource "aws_s3_object" "lambda_zip" {
bucket = aws_s3_bucket.lambda_bucket.id
key = "lambda.zip"
source = "lambda.zip"
}
 
output "bucket_name" {
value = aws_s3_bucket.lambda_bucket.id
}