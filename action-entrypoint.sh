#!/bin/bash

if [ "$1" = "shell" ]; then
  bash
  exit
fi

set -xeou pipefail

pwd
ls -la
git config -l
git config -l --show-origin

FOSSA_PROJECT=$(git config --get remote.origin.url)
FOSSA_REVISION=$(git tag --points-at HEAD | cat)

echo "$FOSSA_PROJECT"
echo "$FOSSA_REVISION"