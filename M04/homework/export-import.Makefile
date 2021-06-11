# Deploy & delete export-import stacks

.PHONY: up down show

up: deploy-log-bucket deploy-website-bucket

deploy-log-bucket:
	COMPONENT="export-import" \
	STACK="log-bucket" \
	TEMPLATE="log-bucket" \
	PARAMETERS="log-bucket" \
	bash website/export-import/commands/deploy-export-import.sh

deploy-website-bucket:
	COMPONENT="export-import" \
	STACK="website" \
	TEMPLATE="website" \
	PARAMETERS="website" \
	bash website/export-import/commands/deploy-export-import.sh
