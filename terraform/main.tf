provider "aws" {
  region = "us-west-2"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  lambda_function_arn = module.lambda.lambda_function_name
}

module "iam_role" {
  source         = "./modules/iam"
  role_name      = "MyLambdaExecutionRole"
  s3_bucket_name = var.bucket_name
}
 
module "lambda" {
  source                = "./modules/lambda"
  lambda_function_name  = var.lambda_function_name
  lambda_role_arn       = module.iam_role.lambda_role_arn
  bucket_name           = module.s3.bucket_name
  s3_bucket_arn         = "arn:aws:s3:::${module.s3.bucket_name}"
  environment_variables = var.lambda_environment_variables
}