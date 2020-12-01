#!/bin/bash

source $GITHUB_WORKSPACE/.github/scripts/common.sh
set -e

CI_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

# Git repo fixup
start_section "environment.git" "Setting up ${YELLOW}git checkout${NC}"
set -x
git fetch --unshallow || true
git fetch --tags
git submodule update --recursive --init
git submodule foreach git submodule update --recursive --init
$SPACER
git remote -v
git branch -v
#git branch -D $CI_BRANCH
CURRENT_GITREV="$(git rev-parse HEAD)"
git checkout -b $CI_BRANCH $CURRENT_GITREV
git tag -l
git status -v
git describe --long
set +x
end_section "environment.git"
