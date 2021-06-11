all: assume-awscli-version
	@echo "Ready to go!"

.PHONY: up down show

up: deploy-log-bucket deploy-website

deploy-log-bucket:
	COMPONENT="export-import" \
	STACK="log-bucket" \
	TEMPLATE="log-bucket" \
	PARAMETERS="log-bucket" \
	bash website/export-import/commands/deploy-export-import.sh

# todo: deploy-website-bucket copy-website-files
deploy-website:
	COMPONENT="export-import" \
	STACK="website" \
	TEMPLATE="website" \
	PARAMETERS="website" \
	bash website/export-import/commands/deploy-export-import.sh

assume-awscli-version:
	@bash awscli-version-expect.sh
