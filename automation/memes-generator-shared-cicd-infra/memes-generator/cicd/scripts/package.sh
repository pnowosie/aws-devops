#!/bin/bash
set -x;
for template in $PROJECT/**/templates/*; do
    prefix=$(echo $template | sed "s|/templates.*||");
    file=$(echo $template | sed "s|^.*/templates/||" | sed "s|\.yaml||");
    mkdir -p build/$prefix/templates;
    aws cloudformation package --template-file $template --s3-bucket $ARTIFACT_BUCKET --s3-prefix $S3_KEY/$PROJECT/$TARGET_STAGE --output-template-file build/$prefix/templates/$file-packaged.yaml;
done