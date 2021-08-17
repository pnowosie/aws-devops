#!/bin/bash

PROJECT="memes-generator"
REGION="eu-west-1"
STAGE=dev


#########  Params ###########

COMPONENT="operations"
STACK="monitoring-dashboard"
TEMPLATE="monitoring-dashboard"
PARAMETERS="monitoring-dashboard"


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
