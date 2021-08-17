#!/bin/bash

PROJECT="memes-generator"
STAGE="ndev"
REGION="us-east-1" ## Must be in N.Virignia region to work


#########  Params ###########

COMPONENT="operations"
STACK="root-login-alert"
TEMPLATE="root-login-alert"
PARAMETERS="root-login-alert"

######### common part #########

TEMPLATE_FILE="$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="$PROJECT/$COMPONENT/parameters/$PARAMETERS-$STAGE.json"

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --no-fail-on-empty-changeset \
    --parameter-overrides file://$PARAM_FILE \
    --region $REGION \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

$deploy
