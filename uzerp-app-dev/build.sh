#!/usr/bin/env bash
set -o errexit

VERSION="20.07"

buildah bud -t quay.io/uzerp/uzerp-app-dev:latest -t quay.io/uzerp/uzerp-app-dev:$VERSION
