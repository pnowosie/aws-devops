#!/bin/bash

PROJECT="memes-generator"
REGION="eu-west-1"


#########  database ###########

COMPONENT="data"

######### common part #########

PARAM_FILE="$PROJECT/$COMPONENT/parameters/create-db-user-remote.json"

send_command="aws ssm send-command \
	--document-name AWS-RunRemoteScript \
	--targets Key=tag:Name,Values=$PROJECT-${Stage}-operations-jumphost-instance \
	--parameters file://$PARAM_FILE \
	--timeout-seconds 600 \
	--region $REGION"

echo ${send_command}

${send_command}
