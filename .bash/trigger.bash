#!/bin/bash

# Variables
OWNER="hashtagf"
REPO="k8s-workshop"
TOKEN=$1
EVENT_TYPE="update-image-event"
TAG=$(cat Cargo.toml | grep version | head -n 1 | awk -F '"' '{print $2}')
PAYLOAD="{\"tag_image\":\"$TAG\"}"

# Dispatch API URL
URL="https://api.github.com/repos/$OWNER/$REPO/dispatches"


# Trigger the event
curl -X POST -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    $URL \
    -d "{\"event_type\":\"$EVENT_TYPE\",\"client_payload\":$PAYLOAD}"