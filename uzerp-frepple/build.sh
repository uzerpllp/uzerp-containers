#!/usr/bin/env bash
set -o errexit

FREPPLE_VER="6.11.0"

buildah bud -t quay.io/uzerp/uzerp-frepple:latest -t quay.io/uzerp/uzerp-frepple:$FREPPLE_VER
