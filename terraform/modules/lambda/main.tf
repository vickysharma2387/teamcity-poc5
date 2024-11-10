resource "aws_lambda_function" "hello_world" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  s3_bucket     = var.bucket_name
  s3_key        = "lambda.zip"
 
  environment {
    variables = var.environment_variables
  }
}
 
resource "aws_lambda_permission" "allow_s3_invoke" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.hello_world.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
}

resource "aws_cloudwatch_log_group" "yada" {
  name = "aws/lambda/${aws_lambda_function.hello_world.function_name}"
  retention_in_days = 7
}
 
# Output the ARN of the Lambda function
output "lambda_function_arn" {
  value = aws_lambda_function.hello_world.arn
}

output "lambda_permission_id" {
  value = aws_lambda_permission.allow_s3_invoke.id
}