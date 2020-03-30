#!/usr/bin/env bash

dockerpath=sg75/mlms:v1

# Run the Docker Hub container with kubernetes
kubectl run --image=$dockerpath mlms-app --port=80

# List kubernetes pods
kubectl get pods

# while loop for pod status

while [ "$(kubectl get pods |head -2|awk 'NR>1{ print $3}' | tr -d '\n')" != "Running" ]; do
    echo "Waiting for POD status: $(kubectl get pods |head -2|awk 'NR>1{ print $3}' | tr -d '\n')"
done
echo "POD is Running"

# Forward the container port to a host
kubectl port-forward --address 0.0.0.0 pod/mlms-app 80:80&

# Shows logs of containers

kubectl logs $(kubectl get pods |head -2|awk 'NR>1{ print $1}'|tr -d '\n')

