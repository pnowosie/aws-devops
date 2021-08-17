#!/bin/bash

set -e

PROJECT=memes-generator
BASE_STAGE=shared-dev
NEW_STAGE=shared-test

# Cloning is made only for selected components
COMPONENTS=(cicd)

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
