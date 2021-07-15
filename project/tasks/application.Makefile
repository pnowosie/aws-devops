REGION ?= "eu-west-1"

## Aplication (in order of deployment)
##
## 1. Buckety na obrazki, konfiguracje CW i appki 
## 2. Baza danych i sekrety w Secrets Manager
## 3. Uprawnienia dla instancji aplikacji
## 4. Launch template dla maszyn EC2
## 5. Instancja EC2 z aplikacją
##    (jumphost został zmieniony od razu na etapie tworzenia zadań 'network' 
## 6. Application Load Balancer
## 7. Autoscaling
##

up: up-buckets up-database up-app-permission up-launch-template up-app-instance up-load-balancer up-autoscaling up-website-ui up-cloudfront

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

up-load-balancer:
	@bash memes-generator/network/commands/deploy-load-balancing.sh

up-autoscaling:
	@bash memes-generator/application/commands/deploy-application-auto-scaling.sh

up-website-ui:
	@bash memes-generator/application/commands/deploy-website-bucket.sh
	@bash memes-generator/application/commands/upload-website-content.sh

up-cloudfront:
	@bash memes-generator/cdn/commands/deploy-cloudfront.sh
