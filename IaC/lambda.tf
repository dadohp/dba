resource "aws_lambda_function" "nama_lambda_function" {
  function_name = "nama_lambda_function"
  description	  = "nama_lambda_function"
  filename	    = "./templates/lambda.zip" ## zip file script function
  role		      = "arn:aws:iam::xxx:role/monitoring"
  handler	      = "lambda.lambda_handler"
  runtime	      = "python3.7"
  memory_size   = 512
  timeout	      = 120

## IF Using VPC Custom
  vpc_config {
    subnet_ids         = ["subnet-xxx", "subnet-xxx"]
    security_group_ids = ["sg-xxx"]
  }

  environment {
    variables	= {
      TOKEN	  = "token_bot"
      USER_ID	= "chat_id"
    }
  }

  tags = {
    Name	  = "nama_lambda_function"
    Project	= "hello-world"
    Ticket  = "nomor_tiket"
    Recipe  = "${var.IAC_REPO}"
    }
}

##
# Output
output "nama_lambda_function" {
  description	= "nama_lambda_function"
  value	     	= [
		           "${aws_lambda_function.nama_lambda_function.function_name}"
		          ]
}
