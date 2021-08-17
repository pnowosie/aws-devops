#!/bin/bash

aws ssm send-command \
    --document-name "$PROJECT-operations-create-db-user" \
    --parameters "Project=$PROJECT,TargetStage=$TARGET_STAGE,Region=$REGION" \
    --document-version "1" \
    --targets "Key=tag:Name,Values=$PROJECT-$TARGET_STAGE-operations-jumphost-db-instance" \
    --timeout-seconds 120 \
    --max-concurrency "50" \
    --max-errors "0" \
    --region $REGION
