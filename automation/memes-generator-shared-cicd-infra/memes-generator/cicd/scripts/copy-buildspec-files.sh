#!/bin/bash
set -e;

for buildspec in $PROJECT/cicd/buildspec/*; do
    prefix=$(echo $buildspec | sed "s|/buildspec.*||");
    mkdir -p build/$prefix/buildspec;
    cp $buildspec build/$prefix/buildspec/
done