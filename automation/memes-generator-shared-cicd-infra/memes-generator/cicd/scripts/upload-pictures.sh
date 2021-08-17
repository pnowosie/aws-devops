#!/bin/bash

set -e

COMPONENT="application"
PARAM_NAME="/$PROJECT/$TARGET_STAGE/$COMPONENT/pictures-bucket/name"
BUCKET=$(aws ssm get-parameter --name $PARAM_NAME --output text --query Parameter.Value --region $REGION)

mkdir -p pictures

cd pictures || exit

curl -LO https://imgflip.com/s/meme/Ancient-Aliens.jpg
curl -LO https://imgflip.com/s/meme/Left-Exit-12-Off-Ramp.jpg
curl -LO https://imgflip.com/s/meme/Doge.jpg

cd ..

echo "Uploading to bucket: $BUCKET"

aws s3 cp pictures "s3://$BUCKET" --recursive --include "*.jpg" --include "*.png"
