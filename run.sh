#!/bin/zsh
container_local_name=cloud-hello-world


image_name=${GOOGLE_CLOUD_REGION}-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/main-container-registry/cloud-hello-world:latest

docker build -t $image_name . &&
docker run -it --rm \
    --name=$container_local_name \
    --volume=${HOME}/.config/gcloud:/app/config/google \
    -e GOOGLE_APPLICATION_CREDENTIALS='/app/config/google/application_default_credentials.json' \
    -e GOOGLE_CLOUD_PROJECT=$GOOGLE_CLOUD_PROJECT \
    -e GOOGLE_CLOUD_REGION=$GOOGLE_CLOUD_REGION \
    $image_name
    