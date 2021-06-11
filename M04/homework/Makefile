# Don't fear the Makefile

COMPONENT ?= "export-import"

.PHONY: up down show

up: assume-awscli deploy-stack copy-files show


deploy-stack:
	${MAKE} -f ${COMPONENT}.Makefile up

show:
	COMPONENT=${COMPONENT} bash display-stack-outputs.sh

copy-files: website_bucket_name=$$(COMPONENT=${COMPONENT} bash get-bucket-name.sh)
copy-files:
	@echo "Copy files to S3 bucket: ${website_bucket_name}"; \
	aws s3 sync "website/website-content/" "s3://${website_bucket_name}"

assume-awscli:
	@bash expect-awscli-version.sh
	@echo "AWS CLI version checked!"
