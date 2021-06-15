#!/bin/bash


#########  Parameters:  ###########
# set via env vars
#  -  COMPONENT    ="export-import"
#     posible values: export-import | nested | parametrized
#

######### common part #########

if [[ -f website/${COMPONENT}/commands/copy-files.sh ]]; then
    echo "Extracting website bucket name from nested stack"
    bash website/${COMPONENT}/commands/copy-files.sh
else
    website_bucket_name=$(COMPONENT=${COMPONENT} bash get-bucket-name.sh)
    echo "Copy website files to S3 bucket: ${website_bucket_name}"
	aws s3 sync "website/website-content/" "s3://${website_bucket_name}"
fi