# Don't fear the Makefile

##TODO: fetch the name of the bucket from the command (unable to make it work in make)
#> aws s3api list-buckets --output text | grep website-single-template | cut -f3
bucket_name := website-single-template-website-dev-s3website-alr6n2kn5srl

.PHONY: up down show
up: deploy upload show

show:
	bash website/single-template/commands/display-stack-outputs.sh

deploy:
	bash website/single-template/commands/deploy-single-template.sh

upload:
	aws s3 sync website-content/ s3://$(bucket_name)

clean:
	@echo "Deleting all content. Bucket: $(bucket_name)"
	aws s3 rm s3://$(bucket_name) --recursive
