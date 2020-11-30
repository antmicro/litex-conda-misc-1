#!/bin/bash

branch=${GITHUB_HEAD_REF:-$CI_BRANCH}
# Move all packages from the current label to the main label
for package in $(anaconda -t $ANACONDA_TOKEN label --show ci-$branch-$GITHUB_RUN_ID 2>&1 | grep + | cut -f2 -d+)
do
    anaconda -t $ANACONDA_TOKEN move --from-label ci-$branch-$GITHUB_RUN_ID --to-label main $package
done
