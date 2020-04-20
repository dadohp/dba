resource "aws_lambda_function" "nama_lambda_function" {
  function_name = "nama_lambda_function"
  description	= "nama_lambda_function"
  filename	    = "./templates/lambda.zip"
  role		    = "arn:aws:iam::xxx:role/monitoring"
  handler	    = "lambda.lambda_handler"
  runtime	    = "python3.7"
  memory_size   = 512
  timeout	    = 120

  environment {
    variables	= {
      TOKEN	    = "token_bot_telegram"
      USER_ID	= "chat_id_number"
    }
  }

  tags = {
    Name	= "nama_lambda_function"
    Project	= "hello-world"
    Ticket      = "nomor_tiket"
    Recipe      = "${var.IAC_REPO}"
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
