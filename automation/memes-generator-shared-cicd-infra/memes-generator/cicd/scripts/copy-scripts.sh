#!/bin/bash
set -e;

for script in $PROJECT/**/scripts/*; do
    prefix=$(echo $script | sed "s|/scripts.*||");
    mkdir -p build/$prefix/scripts;
    cp $script build/$prefix/scripts/
done