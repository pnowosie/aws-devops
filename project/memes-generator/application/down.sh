#!/bin/bash

#DOC: Usuwa stacki utworzone dla zadania 'Application'
##    Make nie potrafi wycofać zmian w odwrotnej kolejności niż utworzone
##    Gdybyśmy połączyli te stacki w jeden nested wycofywanie byłoby prostsze.


Stacks=(
  "$PROJECT-application-application-instance-$STAGE"
  "$PROJECT-application-launch-template-$STAGE"
  "$PROJECT-application-application-permissions-$STAGE"
  "$PROJECT-data-database-$STAGE"
#  "$PROJECT-application-configuration-bucket-$STAGE"
#  "$PROJECT-application-memes-bucket-$STAGE"
#  "$PROJECT-application-pictures-bucket-$STAGE"
)

for stack in ${Stacks[*]}; do
  echo "Deleting stack: $stack"

  delete="aws cloudformation delete-stack \
    --stack-name $stack \
    --region $REGION"

  echo $delete

  $delete
done

