#!/usr/bin/env bash
set -o errexit

VERSION="22.08"

buildah bud -t ghcr.io/uzerpllp/uzerp-app-dev:latest -t ghcr.io/uzerpllp/uzerp-app-dev:$VERSION
