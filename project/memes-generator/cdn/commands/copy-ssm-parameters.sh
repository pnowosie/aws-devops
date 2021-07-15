#!/bin/bash

echo  "Krok z utworzeniem WAF pominięty! Zasoby pod frontend tworzone w eu-west-1" >&2
exit ${2:-1}

PROJECT="memes-generator"
STAGE="dev"

SOURCE_REGION="eu-west-1"
TARGET_REGION="us-east-1"

ALB_PARAM_NAME="/$PROJECT/$STAGE/network/alb/url"
ALB_PARAM=$(aws ssm get-parameter --name $ALB_PARAM_NAME --query 'Parameter.Value' --region $SOURCE_REGION)

ALB_PARAM=$(echo $ALB_PARAM | sed 's/\"//g')

aws ssm put-parameter \
    --name $ALB_PARAM_NAME \
    --value $ALB_PARAM \
    --type String \
    --description "SSM Parameter that stores ALB url" \
    --overwrite \
    --region $TARGET_REGION
