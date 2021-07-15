#!/bin/bash

PROJECT="memes-generator"
STAGE="dev"
REGION="eu-west-1"

COMPONENT="application"
PARAM_NAME="/$PROJECT/$STAGE/$COMPONENT/website-bucket/name"
BUCKET=$(aws ssm get-parameter --name $PARAM_NAME --output text --query Parameter.Value --region $REGION)

echo "Uploading to gui bucket: $BUCKET"

CONTENT_PATH="memes-generator/application/data/website"

aws s3 cp "$CONTENT_PATH" "s3://$BUCKET" --recursive
