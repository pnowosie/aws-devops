#!/bin/bash

PROJECT="memes-generator"
STAGE="dev"
REGION="eu-west-1"


#########  Params ###########

# NAT Gateway A
COMPONENT="network"
STACK="nat-gateway-a"
TEMPLATE="nat-gateway"
PARAMETERS="nat-gateway-a"

######## delete stack ##########

delete="aws cloudformation delete-stack \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --region $REGION"

echo $delete

$delete


# NAT Gateway B
COMPONENT="network"
STACK="nat-gateway-b"
TEMPLATE="nat-gateway"
PARAMETERS="nat-gateway-b"

######## delete stack ##########

delete="aws cloudformation delete-stack \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --region $REGION"

echo $delete

$delete
