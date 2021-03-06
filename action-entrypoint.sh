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
# git config -l --local
# git config --get --local remote.origin.url
cat .git/config

git config --local user.name "foo bar"
git config -l --local

FOSSA_PROJECT=$(git config --get remote.origin.url)
FOSSA_REVISION=$(git tag --points-at HEAD | cat)

echo "$FOSSA_PROJECT"
echo "$FOSSA_REVISION"