#!/bin/bash

#DOC: Usuwa stacki utworzone dla zadania 'Network'
##    Make nie potrafi wycofać zmian w odwrotnej kolejności niż utworzone
##    Gdybyśmy połączyli te stacki w jeden nested wycofywanie byłoby prostsze.


Stacks=(
  "$PROJECT-operations-jumphost-$STAGE"
  "$PROJECT-network-nat-gateway-a-$STAGE"
  "$PROJECT-network-nat-gateway-b-$STAGE"
  "$PROJECT-network-security-groups-$STAGE"
  "$PROJECT-network-network-$STAGE"
  "$PROJECT-operations-log-bucket-$STAGE"
)

for stack in ${Stacks[*]}; do
  echo "Deleting stack: $stack"

  delete="aws cloudformation delete-stack \
    --stack-name $stack \
    --region $REGION"

  echo $delete

  $delete
done

