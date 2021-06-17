#!/bin/bash


PROJECT="website"
STAGE="dev"
STACK="nested"
REGION="eu-west-1"

#########  Parameters:  ###########
# set via env vars
#  -  COMPONENT    ="export-import"
#     posible values: export-import | nested | parametrized
#

get_website_stack_arn="aws cloudformation list-stack-resources \
  --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
  --region $REGION --output text \
  --query=StackResourceSummaries[?LogicalResourceId=='Website'].PhysicalResourceId"

echo "$get_website_stack_arn"

website_stack_arn=$($get_website_stack_arn)

[[ -z "$website_stack_arn" ]] && fail "Cannot fetch nested stack for website"

echo "Getting website bucket name from nested stack"
#echo "$website_stack_arn"

get_website_bucket_name="aws cloudformation describe-stacks \
	--stack-name $website_stack_arn \
	--region $REGION --output text \
	--query Stacks[].Outputs[?OutputKey=='S3BucketName'].OutputValue"

echo "$get_website_bucket_name"

website_bucket_name=$($get_website_bucket_name)
echo "Copy website files to S3 bucket: ${website_bucket_name}"
aws s3 sync "website/website-content/" "s3://${website_bucket_name}"
