#!/bin/bash

PROJECT="memes-generator"
SHARED_STAGE="shared"
REGION="eu-west-1"

######### Params ###########

COMPONENT="cicd"
TYPE="infra"
STACK="repository-$TYPE"
TEMPLATE="repository"
PARAMETERS="repository-$TYPE"

######### common part #########

TEMPLATE_FILE="$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="$COMPONENT/parameters/$PARAMETERS-$SHARED_STAGE.json"

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK-$SHARED_STAGE \
    --no-fail-on-empty-changeset \
    --parameter-overrides file://$PARAM_FILE \
    --region $REGION \
    --tags Project=$PROJECT SharedStage=$SHARED_STAGE Component=$COMPONENT Type=$TYPE"

echo $deploy

$deploy
