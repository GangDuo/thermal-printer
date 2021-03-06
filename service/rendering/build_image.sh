#!/bin/bash
set -eu
IMAGE_NAME=thermal-printer/service/rendering
cd -- `dirname -- $0`
docker image build --pull \
  --file Dockerfile \
  --tag ${IMAGE_NAME} \
  .
