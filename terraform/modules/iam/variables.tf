variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}
 
variable "s3_bucket_name" {
  description = "The name of the S3 bucket that the Lambda will access"
  type        = string
}