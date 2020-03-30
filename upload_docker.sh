#!/usr/bin/env bash

dockerpath=sg75/mlms:v1
echo "Docker ID and Image: $dockerpath"
docker login
docker push $dockerpath

