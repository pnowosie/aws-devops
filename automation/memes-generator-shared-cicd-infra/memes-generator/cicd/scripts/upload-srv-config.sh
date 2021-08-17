#!/bin/bash

set -e

COMPONENT="application"
PARAM_NAME="/$PROJECT/$TARGET_STAGE/$COMPONENT/configuration-bucket/name"
BUCKET=$(aws ssm get-parameter --name $PARAM_NAME --output text --query Parameter.Value --region $REGION)

echo "Uploading to bucket: $BUCKET"

CONFIG_FILE=".memesconf-$TARGET_STAGE"
CONFIG_OBJECT=".memesconf"
aws s3 cp "$PROJECT/$COMPONENT/config/$CONFIG_FILE" "s3://$BUCKET/service/$CONFIG_OBJECT"
