variable "bucket_name" {
  type = string
}
 
variable "lambda_function_name" {
  type = string
}
 
variable "lambda_role_arn" {
  type = string
}
 
variable "lambda_environment_variables" {
  type        = map(string)
  default     = {}
}