resource "aws_lambda_function" "hello_world" {
  function_name = var.lambda_function_name
  runtime       = "python3.9"
  role          = var.lambda_role_arn
  handler       = "lambda_function.lambda_handler"
 
  s3_bucket     = var.bucket_name
  s3_key = "lambda.zip"
 
  environment {
    variables = var.environment_variables
  }
}

resource "aws_lambda_permission" "allow_s3_invoke" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.hello_world.function_name
  principal = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
}
 
output "lambda_function_name" {
  value = aws_lambda_function.hello_world.function_name
}