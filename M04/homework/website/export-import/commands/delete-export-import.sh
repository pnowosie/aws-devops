#!/bin/bash

PROJECT="website"
STAGE="dev"
REGION="eu-west-1"


#########  website ###########

COMPONENT="export-import"
STACK="website"
TEMPLATE="website"
PARAMETERS="website"

######### common part #########

remove="aws cloudformation delete-stack \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --region $REGION"

echo "$remove"

$remove


#########  log bucket ###########

COMPONENT="export-import"
STACK="log-bucket"
TEMPLATE="log-bucket"
PARAMETERS="log-bucket"

######### common part #########

remove="aws cloudformation delete-stack \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --region $REGION"

echo "$remove"

$remove
