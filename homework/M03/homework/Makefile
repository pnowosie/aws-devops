# Don't fear the Makefile

.PHONY: up down show
up: deploy-stack upload-files show
down: delete-files delete-stack

show:
	bash website/single-template/commands/display-stack-outputs.sh | tee

deploy-stack:
	bash website/single-template/commands/deploy-single-template.sh

upload-files:
	@bucket_name=$$(bash website/single-template/commands/get-bucket-name.sh); \
	echo "Synchronizing content. Bucket: $${bucket_name}"; \
	aws s3 sync website-content/ "s3://$${bucket_name}"

delete-stack:
	bash website/single-template/commands/delete-stack.sh

delete-files:
	@bucket_name=$$(bash website/single-template/commands/get-bucket-name.sh); \
	echo "Deleting all content. Bucket: $${bucket_name}"; \
	aws s3 rm "s3://$${bucket_name}" --recursive
