#!/bin/bash
echo "pvt_key=\"~/.ssh/id_rsa\"" > config.tfvars
echo "do_token=\"$DO_PAT\"" >> config.tfvars
echo "AWS_ACCESS_KEY_ID=\"$AWS_ACCESS_KEY_ID\"" >> config.tfvars
echo "AWS_SECRET_ACCESS_KEY=\"$AWS_SECRET_ACCESS_KEY\"" >> config.tfvars
echo "AWS_DEFAULT_REGION=\"$AWS_DEFAULT_REGION\"" >> config.tfvars
echo "AWS_S3_BUCKET_NAME=\"$AWS_S3_BUCKET_NAME\"" >> config.tfvars
echo "AWS_S3_BACKUP_NAME=\"$AWS_S3_BACKUP_NAME\"" >> config.tfvars

