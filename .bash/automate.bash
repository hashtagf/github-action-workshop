#! /bin/bash

# cargo check
# cargo test

DOCKER_HUB_USERNAME=$1
DOCKER_HUB_PASSWORD=$2

export TAG=$(cat Cargo.toml | grep version | head -n 1 | awk -F '"' '{print $2}')
echo "TAG: $TAG"

docker build . -t flhpktech/rust-demo:$TAG


echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin
docker push flhpktech/rust-demo:$TAG


