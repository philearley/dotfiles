#!/bin/bash

VERSION=v2_58_0

release_notes=$(cat "v2_58_0.html.md")

git checkout -b release-$VERSION

RELEASE_TITLE="Run release steps for $VERSION"

cat > "./release-file.txt" <<EOF
  $RELEASE_TITLE

  $release_notes
EOF


hub add .
hub commit -m "$RELEASE_TITLE"
hub push origin release-$VERSION
# hub pull-request -b "philearley:master" -h "philearley:release-$VERSION" -F "./release-file.txt" --assign "philearley"
hub pull-request -a "philearley" -b "philearley:master" -h "philearley:release-$VERSION" -m "$RELEASE_TITLE" -m "" -m "$release_notes" -l "Targaryen,Pending Review"
