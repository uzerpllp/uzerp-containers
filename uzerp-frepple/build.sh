#!/usr/bin/env bash
set -o errexit

# frepple version to build into the container image
FREPPLE_VER="6.22.0"

# Build the image using buildah
buildah bud --build-arg FREPPLE_VERSION=$FREPPLE_VER -t quay.io/uzerp/uzerp-frepple:latest -t quay.io/uzerp/uzerp-frepple:$FREPPLE_VER
