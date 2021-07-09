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

