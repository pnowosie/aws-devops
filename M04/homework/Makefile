# Don't fear the Makefile

COMPONENT ?= "export-import"

.PHONY: up down show

up: assume-awscli deploy-${COMPONENT} copy-files show
down: assume-awscli delete-files delete-${COMPONENT}


deploy-${COMPONENT}:
	bash website/${COMPONENT}/commands/deploy-${COMPONENT}.sh

delete-${COMPONENT}:
	bash website/${COMPONENT}/commands/delete-${COMPONENT}.sh

show:
	COMPONENT=${COMPONENT} bash display-stack-outputs.sh

copy-files: website_bucket_name=$$(COMPONENT=${COMPONENT} bash get-bucket-name.sh)
copy-files:
	@echo "Copy files to S3 bucket: ${website_bucket_name}"; \
	aws s3 sync "website/website-content/" "s3://${website_bucket_name}"

delete-files: website_bucket_name=$$(COMPONENT=${COMPONENT} bash get-bucket-name.sh)
delete-files:
	@echo "Delete files from S3 bucket: ${website_bucket_name}"; \
	aws s3 rm "s3://${website_bucket_name}" --recursive

assume-awscli:
	@bash expect-awscli-version.sh
	@echo "AWS CLI version checked!"
