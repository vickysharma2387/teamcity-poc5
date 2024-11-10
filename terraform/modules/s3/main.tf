resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "lambda_zip" {
bucket = aws_s3_bucket.lambda_bucket.id
key = "lambda.zip"
source = "lambda.zip"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
bucket = aws_s3_bucket.lambda_bucket.id
 
  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".zip"
  }
 
  depends_on = [aws_lambda_permission.allow_s3_invoke]
}
 
output "bucket_name" {
value = aws_s3_bucket.lambda_bucket.id
}