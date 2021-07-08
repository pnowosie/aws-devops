# Don't fear the Makefile

# IaC deployment process for the Memes-Generator website
# AWS components that will be provisioned:
up: .network .application

down: down-network down-application

clean:
	rm .network

.network:
	${MAKE} -f tasks/network.Makefile up
	touch .network

.application:
	${MAKE} -f tasks/application.Makefile up
	touch .application

down-network:
	${MAKE} -f tasks/network.Makefile down
	rm .network

down-application:
	${MAKE} -f tasks/application.Makefile down
	rm .application

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
	  --output yaml

