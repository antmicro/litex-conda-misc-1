#!/bin/bash

source $GITHUB_WORKSPACE/.github/scripts/common.sh
set -e

if [[ $UPLOAD == "no-upload" ]]; then
    echo "Job without upload..."
else
    echo "Job with Conda upload..."

    $SPACER
    if [ x$ANACONDA_TOKEN != x ]; then
        start_section "package.upload" "${GREEN}Package uploading...${NC}"
        anaconda -t $ANACONDA_TOKEN upload --no-progress --user $ANACONDA_USER --label ci-${GITHUB_HEAD_REF:-$CI_BRANCH}-$GITHUB_RUN_ID $CONDA_OUT
        end_section "package.upload"
    else
        echo "ANACONDA_TOKEN not found. Please consult README of litex-conda-ci for details on setting up tests properly."
        echo "Packages cannot be uploaded when tests are running for cross-repository Pull Requests."
    fi

    $SPACER
fi

start_section "success.tail" "${GREEN}Success output...${NC}"
echo "Log is $(wc -l /tmp/output.log) lines long."
echo "Displaying last 1000 lines"
echo
tail -n 1000 /tmp/output.log
end_section "success.tail"
