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

get_name="aws cloudformation describe-stacks \
	--stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
	--region $REGION --output text \
	--query Stacks[].Outputs[?OutputKey=='S3BucketName'].OutputValue"

# Intentionally suppress additional output
$get_name
