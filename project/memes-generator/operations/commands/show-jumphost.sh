#!/bin/bash

PROJECT="memes-generator"
STAGE="dev"
REGION="eu-west-1"


#########  Params ###########

COMPONENT="operations"
STACK="jumphost"
TEMPLATE="jumphost"
PARAMETERS="jumphost"

######### common part #########

outputs="aws cloudformation describe-stacks \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --output yaml \
    --query Stacks[].Outputs[] \
    --region $REGION"

echo "$outputs"

$outputs
