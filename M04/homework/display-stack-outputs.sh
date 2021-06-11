#!/bin/bash

PROJECT="website"
STAGE="dev"
STACK="website"
REGION="eu-west-1"

#########  Parameters:  ###########
# set via env vars
#  -  COMPONENT    ="export-import"
#

######### common part #########

outputs="aws cloudformation describe-stacks \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --output table \
    --query Stacks[].Outputs[] \
    --region $REGION"

echo "$outputs"

$outputs