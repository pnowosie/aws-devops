#!/bin/bash
for param in $PROJECT/**/parameters/*.json; do
    prefix=$(echo $param | sed "s|/parameters.*||");
    component=$(echo $param | sed "s|$PROJECT/||" | sed "s|/parameters.*||" )
    file=$(echo $param | sed "s|^.*/parameters/||" | sed "s|\.json||");
    mkdir -p build/$prefix/config-files;
    cat $param | jq -jr "( map( { (.ParameterKey): .ParameterValue } ) | add) | {\"Parameters\": ., \"Tags\": {\"Project\": \"$PROJECT\", \"Stage\": \"$TARGET_STAGE\", \"Component\": \"$component\" }}" > build/$prefix/config-files/$file.json;
done