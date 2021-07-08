#!/bin/bash

aws ssm send-command \
    --document-name "AWSFIS-Run-CPU-Stress" \
    --document-version "2" \
    --targets '[{"Key":"tag:Project","Values":["memes-generator"]},{"Key":"tag:Stage","Values":["dev"]},{"Key":"tag:Component","Values":["application"]}]' \
    --parameters '{"CPU":["0"],"InstallDependencies":["True"],"DurationSeconds":["600"]}' \
    --timeout-seconds 600 \
    --max-concurrency "50" \
    --max-errors "0" \
    --region eu-west-1
