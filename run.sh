#!/bin/zsh

google_project=test-stuff-349017
google_region=europe-north1

container_local_name=cloud-hello-world


image_name=${google_region}-docker.pkg.dev/${google_project}/main-container-registry/cloud-hello-world:latest

docker build -t $image_name . &&
docker run -it --rm \
    --name=$container_local_name \
    --volume=${HOME}/.config/gcloud:/app/config/google \
    -e GOOGLE_APPLICATION_CREDENTIALS='/app/config/google/application_default_credentials.json' \
    -e GOOGLE_CLOUD_PROJECT=$google_project \
    -e GOOGLE_CLOUD_REGION=$google_region \
    $image_name
    