#!/bin/zsh

google_project=test-stuff-349017
google_region=europe-north1

image_name=${google_region}-docker.pkg.dev/${google_project}/main-container-registry/cloud-hello-world:latest

docker build --platform linux/amd64 -t $image_name . &&
docker push $image_name