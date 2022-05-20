#!/usr/bin/env bash
set -o errexit

VERSION=10
buildah bud -t ghcr.io/uzerpllp/uzerp-postgres:latest -t ghcr.io/uzerpllp/uzerp-postgres:$VERSION
