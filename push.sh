#!/bin/zsh
image_name=${GOOGLE_CLOUD_REGION}-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/main-container-registry/cloud-hello-world:latest

docker build --platform linux/amd64 -t $image_name . &&
docker push $image_name