#!/bin/bash

VERSION=v2_58_0

# while read p; do
#   echo "$p"
# done < ./release_notes/$VERSION.html.md

release_notes=$(cat "./../s1_gac_ui/release_notes/$VERSION.html.md")
echo "$release_notes"

git checkout -b release-$VERSION

RELEASE_TITLE="Run release steps for $VERSION"

cat > "./release-file.txt" <<EOF
  $RELEASE_TITLE

  $release_notes
EOF

hub add .
hub commit -m "$RELEASE_TITLE"
hub push origin release-$VERSION
hub pull-request -b "philearley:master" -h "philearley:release-$VERSION" -f "./release-file.txt" -a "philearley"
