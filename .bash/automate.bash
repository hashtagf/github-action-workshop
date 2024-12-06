#! /bin/bash

# cargo check
# cargo test

export TAG=$(cat Cargo.toml | grep version | head -n 1 | awk -F '"' '{print $2}')
echo "TAG: $TAG"

docker build . -t flhpktech/rust-demo:$TAG


echo $PASSWORD_DOCKER | docker login -u flhpktech --password-stdin
docker push flhpktech/rust-demo:$TAG


