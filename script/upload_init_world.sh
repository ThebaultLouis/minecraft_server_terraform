#!/bin/bash
# Init bash backup command
rm init_world/save.sh
touch init_world/save.sh
chmod +x init_world/save.sh

# aws credentials
echo "export AWS_ACCESS_KEY_ID='${AWS_ACCESS_KEY_ID}'" >> init_world/save.sh
echo "export AWS_SECRET_ACCESS_KEY='${AWS_SECRET_ACCESS_KEY}'" >> init_world/save.sh
echo "export AWS_DEFAULT_REGION='${AWS_DEFAULT_REGION}'" >> init_world/save.sh

# Zip
echo "zip -r '${AWS_S3_BACKUP_NAME}.zip' *" >> init_world/save.sh

# Upload to S3
echo "aws s3 cp '${AWS_S3_BACKUP_NAME}.zip' 's3://${AWS_S3_BUCKET_NAME}/${AWS_S3_BACKUP_NAME}.zip'" >> init_world/save.sh

# Upload
cd init_world
zip "../$AWS_S3_BACKUP_NAME.zip" * 
cd ..
aws s3 cp "$AWS_S3_BACKUP_NAME.zip" "s3://$AWS_S3_BUCKET_NAME/$AWS_S3_BACKUP_NAME.zip"
rm -r "$AWS_S3_BACKUP_NAME.zip"