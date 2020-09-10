#!/bin/sh -l

BRANCH_NAME="${1#refs/heads/}"

# shellcheck disable=SC2039
BRANCH_TAG="${BRANCH_NAME/\//-}"

echo "::set-env name=BRANCH_TAG::$BRANCH_TAG"
echo "::set-output name=branch_tag::$BRANCH_TAG"
