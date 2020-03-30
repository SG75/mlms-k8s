#!/usr/bin/env bash
image=sg75/mlms:v1
echo $image
docker build --tag $image . 
docker images
docker run -it --rm -p 80:80 $image
