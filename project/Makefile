# Don't fear the Makefile

# IaC deployment process for the Memes-Generator website
# AWS components that will be provisioned:

## Network (in correct order of setup)
## 
## 1. S3 bucket for VPS logs
## 2. VPS networks with subnets and route tables
## 3. Network related security groups
## 4. NAT Gateways

up: deploy-log-bucket deploy-network deploy-security-groups deploy-nat-gateway

down: delete-nat-gateway

deploy-log-bucket:
	@bash memes-generator/operations/commands/deploy-log-bucket.sh

deploy-network:
	@bash memes-generator/network/commands/deploy-network.sh

deploy-security-groups:
	@bash memes-generator/network/commands/deploy-security-groups.sh

deploy-nat-gateway:
	@bash memes-generator/network/commands/deploy-nat-gateway.sh

delete-nat-gateway:
	@bash memes-generator/network/commands/delete-nat-gateway.sh
