#!/bin/bash
MAXSIZE=51000

for template in $PROJECT/**/templates/*; do
    echo $template
    size=$(stat -c%s ${template})
    if [ $size -le $MAXSIZE ]; then
        echo ":: Validating $template template, which size ($size bytes) is less than maximum allowed..."
        aws cloudformation validate-template --template-body file://${template} >/dev/null
    else
        echo ":: The template $template size exceeds the maximum that can be validated. Skipping."
    fi;
done