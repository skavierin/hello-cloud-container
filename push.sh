#!/bin/zsh

image_name=europe-north1-docker.pkg.dev/test-stuff-349017/main-container-registry/cloud-hello-world:latest

docker build --platform linux/amd64 -t $image_name . &&
docker push $image_name