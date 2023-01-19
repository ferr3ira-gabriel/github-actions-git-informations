#!/bin/bash -x

echo ${GITHUB_REF#refs/heads/}
echo ${GITHUB_SHA::7}
echo ${GITHUB_REF#refs/*/}

REF=${GITHUB_REF#refs/heads/}
COMMIT_ID=${GITHUB_SHA::7}

if [[ "$REF" == "develop" ]]; then
    printf "Branch name: $REF \nCommit ID: $COMMIT_ID"
    echo "RELEASE_VERSION=$COMMIT_ID" >> $GITHUB_ENV
    echo "GITOPS_BRANCH=develop" >> $GITHUB_ENV

elif [[ "$REF" == *"-rc_"* ]]; then
    printf "New tag: ${GITHUB_REF#refs/*/}"
    echo "RELEASE_VERSION=${GITHUB_REF#refs/*/}" >> $GITHUB_ENV
    echo "GITOPS_BRANCH=homolog" >> $GITHUB_ENV

elif [[ ${GITHUB_REF#refs/*/} =~ ^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-((0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*))*))?(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))?$ ]]; then
    printf "New tag: ${GITHUB_REF#refs/*/}"
    echo "RELEASE_VERSION=${GITHUB_REF#refs/*/}" >> $GITHUB_ENV
    echo "GITOPS_BRANCH=release" >> $GITHUB_ENV

fi
