#!/bin/bash

PROJECT="website"
STAGE="dev"
REGION="eu-west-1"

######### single-template ###########

COMPONENT="single-template"
STACK="website"

######### common part #########

remove="aws cloudformation delete-stack \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --region $REGION"

echo "$remove"

$remove