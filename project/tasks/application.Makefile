REGION ?= "eu-west-1"

## Aplication (in order of deployment)
##
## 1. Buckety na obrazki, konfiguracje CW i appki 


up: up-buckets up-database up-app-permission up-launch-template up-app-instance

down:
	@bash memes-generator/application/down.sh


up-buckets:
	@bash memes-generator/application/commands/deploy-bucket.sh
	@bash memes-generator/application/commands/upload-cw-config.sh
	@bash memes-generator/application/commands/upload-srv-config.sh
	@bash memes-generator/application/commands/upload-pictures.sh

up-database:
	@bash memes-generator/data/commands/deploy-database.sh
	# Na jumphost-db wykonaj
	# memes-generator/data/commands/create-db-app-user.sh

up-app-permission:
	@bash memes-generator/application/commands/deploy-application-permissions.sh

up-launch-template:
	@bash memes-generator/application/commands/deploy-launch-template.sh

up-app-instance:
	@bash memes-generator/application/commands/deploy-application-instance.sh

