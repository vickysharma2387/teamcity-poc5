bucket_name = "teamcity-test-s3"
lambda_function_name = "teamcity-test-lambda"
lambda_role_arn = module.iam_role.lambda_role_arn
lambda_environment_variables = {
  KEY = "VALUE"
}