variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "lambda_function_arn" {
  description = "ARN of the Lambda"
  type        = string
}

variable "lambda_permission_id" {
  description = "Permission id of the Lambda"
  type        = string
}