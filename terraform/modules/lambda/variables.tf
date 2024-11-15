variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}
 
variable "bucket_name" {
  description = "Name of the S3 bucket for the Lambda function code"
  type        = string
}
 
variable "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda"
  type        = string
}
 
variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}

variable "s3_object_version" {
  description = "Object version of the S3 bucket"
  type        = string
}
