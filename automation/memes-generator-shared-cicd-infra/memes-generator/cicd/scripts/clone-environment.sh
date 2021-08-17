#!/bin/bash

set -e

PROJECT=memes-generator
BASE_STAGE=dev
NEW_STAGE=ndev

# Cloning is made only for selected components
COMPONENTS=(application data network operations)

for component in ${COMPONENTS[@]}; do
    for param_file in $PROJECT/$component/parameters/*-$BASE_STAGE.json; do
        echo $param_file
        prefix=$(echo $param_file | sed "s|/parameters.*||");
        echo $prefix
        file=$(echo $param_file | sed "s|^.*/parameters/||" | sed "s|\-$BASE_STAGE.json||");
        echo $file
        sed "s|$BASE_STAGE|$NEW_STAGE|g" $param_file > $prefix/parameters/$file-$NEW_STAGE.json;
    done
done

sed "s|$BASE_STAGE|$NEW_STAGE|g" $PROJECT/application/config/cloudwatch-config-$PROJECT-$BASE_STAGE.json > $PROJECT/application/config/cloudwatch-config-$PROJECT-$NEW_STAGE.json;

sed "s|$BASE_STAGE|$NEW_STAGE|g" $PROJECT/application/config/.memesconf-$BASE_STAGE > $PROJECT/application/config/.memesconf-$NEW_STAGE;
