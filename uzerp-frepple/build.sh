#!/usr/bin/env bash
set -o errexit

# frepple version to build into the container image
FREPPLE_VER="6.22.0"

# Build the image using buildah
buildah bud --build-arg FREPPLE_VERSION=$FREPPLE_VER -t ghcr.io/uzerpllp/uzerp-frepple:latest -t ghcr.io/uzerpllp/uzerp-frepple:$FREPPLE_VER
