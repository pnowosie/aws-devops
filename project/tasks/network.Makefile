## Network (in correct order of setup)
## 
## 1. S3 bucket for VPS logs
## 2. VPS networks with subnets and route tables
## 3. Network related security groups
## 4. NAT Gateways
#TODO: add `up-nat-gateway`
up: up-log-bucket up-network up-security-groups up-jumphost

down: down-nat-gateway


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
