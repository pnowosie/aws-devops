#!/bin/bash

PROJECT="memes-generator"
SHARED_STAGE="shared-dev"
REGION="eu-west-1"

######### Params ###########

TARGET_STAGE="dev"

COMPONENT="cicd"
STACK="create-resources-pipeline"
TEMPLATE="create-resources-pipeline"
PARAMETERS="create-resources-pipeline"

######### common part #########

TEMPLATE_FILE="$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="$PROJECT/$COMPONENT/parameters/$PARAMETERS-target-$TARGET_STAGE-$SHARED_STAGE.json"

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK-target-$TARGET_STAGE-$SHARED_STAGE \
    --no-fail-on-empty-changeset \
    --capabilities CAPABILITY_IAM \
    --parameter-overrides file://$PARAM_FILE \
    --region $REGION \
    --tags Project=$PROJECT SharedStage=$SHARED_STAGE Component=$COMPONENT TargetStage=$TARGET_STAGE"

echo $deploy

$deploy