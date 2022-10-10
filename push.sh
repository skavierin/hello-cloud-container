#!/bin/zsh

image_name=europe-north1-docker.pkg.dev/YOUR_PROJECT_ID_HERE/main-container-registry/cloud-hello-world:latest

docker build --platform linux/amd64 -t $image_name . &&
docker push $image_name