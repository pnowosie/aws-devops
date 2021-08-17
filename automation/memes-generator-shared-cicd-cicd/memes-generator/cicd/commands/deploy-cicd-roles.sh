#!/bin/bash

PROJECT="memes-generator"
STAGE="dev"
# STAGE="test"
# STAGE="prod"
REGION="eu-west-1"

######### Params ###########

COMPONENT="cicd"
STACK="cicd-roles"
TEMPLATE="cicd-roles"
PARAMETERS="cicd-roles"

######### common part #########

TEMPLATE_FILE="$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="$PROJECT/$COMPONENT/parameters/$PARAMETERS-$STAGE.json"

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --no-fail-on-empty-changeset \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameter-overrides file://$PARAM_FILE \
    --region $REGION \
    --tags Project=$PROJECT SharedStage=$STAGE Component=$COMPONENT"

echo $deploy

$deploy