#!/bin/bash

if [ "$1" = "shell" ]; then
  bash
  exit
fi

# assume git safe.directory is the current working directory
# in GitHub Actions there is a $GITHUB_WORKSPACE that is set in a docker container
# Reference:
#   - https://git-scm.com/docs/git-config/2.35.2
#   - https://github.blog/2022-04-12-git-security-vulnerability-announced/
safe_dir=$(pwd)
if [ -n "$GITHUB_WORKSPACE" ]; then
  safe_dir="$GITHUB_WORKSPACE"
fi

set -xeou pipefail

pwd
ls -la
git config -l
git config -l --show-origin
# git config -l --local
# git config --get --local remote.origin.url
cat .git/config

git config --global --add safe.directory "$safe_dir"
git rev-parse --abbrev-ref HEAD
#git config --local user.name "foo bar"
#git config -l --local

git --git-dir=./.git status

git init
git config -l

FOSSA_PROJECT=$(git config --get remote.origin.url)
FOSSA_REVISION=$(git tag --points-at HEAD | cat)

echo "$FOSSA_PROJECT"
echo "$FOSSA_REVISION"