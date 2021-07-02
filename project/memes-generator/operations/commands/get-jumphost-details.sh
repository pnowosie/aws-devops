#!/bin/bash

PROJECT="memes-generator"
STAGE="dev"
REGION="eu-west-1"


#########  Params ###########

COMPONENT="operations"
STACK="jumphost-db"

######### common part #########

outputs="aws ec2 describe-instances \
    --filter Name=tag:Name,Values=${PROJECT}-${STAGE}-${COMPONENT}-${STACK}-instance \
    --query Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress,PublicDnsName] \
    --output text \
    --region $REGION"

$outputs
