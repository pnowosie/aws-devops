REGION ?= "eu-west-1"

## Network (in order of deployment)
## 
## 1. S3 bucket for VPS logs
## 2. VPS networks with subnets and route tables
## 3. Network related security groups
## 4. NAT Gateways
## 5. Jumphost EC2
##

up: up-log-bucket up-network up-security-groups up-nat-gateway up-jumphost

down:
	@bash memes-generator/network/down.sh


up-log-bucket:
	@bash memes-generator/operations/commands/deploy-log-bucket.sh

up-network:
	@bash memes-generator/network/commands/deploy-network.sh

up-security-groups:
	@bash memes-generator/network/commands/deploy-security-groups.sh

up-nat-gateway:
	@bash memes-generator/network/commands/deploy-nat-gateway.sh

up-jumphost:
	@bash memes-generator/operations/commands/deploy-jumphost.sh

down-nat-gateway:
	@bash memes-generator/network/commands/delete-nat-gateway.sh

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
