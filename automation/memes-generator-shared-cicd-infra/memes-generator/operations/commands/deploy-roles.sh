#!/bin/bash

PROJECT="memes-generator"
#STAGE="dev"
REGION="eu-west-1"


#########  Params ###########

COMPONENT="operations"
STACK="roles"
TEMPLATE="roles"
PARAMETERS="roles"


######### common part #########

TEMPLATE_FILE="$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="$PROJECT/$COMPONENT/parameters/$PARAMETERS.json"

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK \
    --no-fail-on-empty-changeset \
    --parameter-overrides file://$PARAM_FILE \
    --capabilities CAPABILITY_NAMED_IAM \
    --region $REGION \
    --tags Project=$PROJECT Component=$COMPONENT"

$deploy
