#!bin/bash

# Get status until cluster is ready
n=0
until [ "$n" -ge 5 ]
do
   zbctl --insecure status && break 
   n=$((n+1)) 
   sleep 15
done

# Deploy worfklows
sleep 10
zbctl --insecure deploy random.bpmn

# Execute workflows
while true; do 
   zbctl --insecure create instance random
   sleep 10
done