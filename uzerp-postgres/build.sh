#!/usr/bin/env bash
set -o errexit

VERSION=10
buildah bud -t quay.io/uzerp/uzerp-postgres:latest -t quay.io/uzerp/uzerp-postgres:$VERSION
