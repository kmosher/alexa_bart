lambda.zip: lambda_function.py venv
	zip lambda.zip lambda_function.py setup.cfg
	cd venv/lib/python2.7/site-packages/ && zip -r ../../../../lambda.zip bart_api

.PHONY: push
push: lambda.zip
	aws --profile devc --region us-east-1 \
	lambda update-function-code \
	--function-name alexa_bart \
	--zip-file fileb://lambda.zip

clean:
	rm lambda.zip
