#!/bin/bash

set -ex

COMPONENT="application"
PARAM_NAME="/$PROJECT/$TARGET_STAGE/$COMPONENT/configuration-bucket/name"
BUCKET=$(aws ssm get-parameter --name $PARAM_NAME --output text --query Parameter.Value --region $REGION)

echo "Uploading to bucket: $BUCKET"

APPLICATION="$PROJECT"
CONFIG_FILE="cloudwatch-config-$APPLICATION-$TARGET_STAGE.json"
aws s3 cp "$PROJECT/application/config/$CONFIG_FILE" "s3://$BUCKET/cloudwatch/$CONFIG_FILE"
