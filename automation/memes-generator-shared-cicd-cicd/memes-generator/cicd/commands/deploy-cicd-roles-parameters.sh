#!/bin/bash

PROJECT="memes-generator"
SHARED_STAGE="shared-dev"
REGION="eu-west-1"

######### Params ###########

COMPONENT="cicd"
STACK="cicd-roles-parameters"
TEMPLATE="cicd-roles-parameters"
PARAMETERS="cicd-roles-parameters"

######### common part #########

TEMPLATE_FILE="$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="$PROJECT/$COMPONENT/parameters/$PARAMETERS-$SHARED_STAGE.json"

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK-$SHARED_STAGE \
    --no-fail-on-empty-changeset \
    --parameter-overrides file://$PARAM_FILE \
    --region $REGION \
    --tags Project=$PROJECT SharedStage=$SHARED_STAGE Component=$COMPONENT"

echo $deploy

$deploy