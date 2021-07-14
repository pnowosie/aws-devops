show-ec2-instances:
	aws ec2 describe-instances \
	  --region $${REGION} \
	  --query "Reservations[].Instances[].[InstanceId,State.Name,Tags[?Key=='Name']]" \
	  --output yaml

list-stacks:
	aws cloudformation list-stacks \
	  --region $${REGION} \
	  --query "StackSummaries[].StackName" \
	  --stack-status-filter CREATE_COMPLETE \
	  --output yaml

show-stack:
	@aws cloudformation describe-stacks \
	  --stack-name ${stack_name} \
	  --region $${REGION} \
	  --query "Stacks[].[StackName,Outputs[]]" \
	  --output json

show-jumphost:
	@bash memes-generator/operations/commands/show-jumphost.sh

get-jumphost-details:
	@bash memes-generator/operations/commands/get-jumphost-details.sh

get-jumphost-status: instance_id=$$(bash memes-generator/operations/commands/get-jumphost-details.sh | cut -f1)
get-jumphost-status:
	@aws ec2 describe-instance-status --instance-ids ${instance_id} --region ${REGION}

connect-jumphost: instance_id=$$(bash memes-generator/operations/commands/get-jumphost-details.sh | cut -f1)
connect-jumphost:
	@aws ssm start-session --target ${instance_id} --region ${REGION}

do-jumphost-start: instance_id=$$(bash memes-generator/operations/commands/get-jumphost-details.sh | cut -f1)
do-jumphost-start:
	@aws ec2 start-instances --instance-ids ${instance_id} --region ${REGION}

do-jumphost-stop: instance_id=$$(bash memes-generator/operations/commands/get-jumphost-details.sh | cut -f1)
do-jumphost-stop:
	@aws ec2 stop-instances --instance-ids ${instance_id} --region ${REGION}

show-lb-stack: stack_name="$${PROJECT}-network-load-balancing-$${STAGE}"
show-lb-stack: show-stack

# ALB_URL="http://$(cmd show-lb-stack | jq -r '.[0][1][1].OutputValue')"
# cmd show-app-status lb_url=$ALB_URL
show-app-status:
	echo "LB URL: ${lb_url}"; \
	curl ${lb_url}/actuator/health

