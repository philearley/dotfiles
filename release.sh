#!/bin/bash
set -ex
VERSION=v2_5810

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
hub pull-request -a "philearley" -b "philearley:master" -h "philearley:$(git rev-parse --abbrev-ref HEAD)" -m "$RELEASE_TITLE" -m "" -m "$release_notes" -l "Targaryen,Pending Review"
