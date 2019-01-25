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

/home/developer/go/src/github.com/github/hub/bin/hub add .
/home/developer/go/src/github.com/github/hub/bin/hub commit -m "$RELEASE_TITLE"
/home/developer/go/src/github.com/github/hub/bin/hub push origin release-$VERSION
# hub pull-request -b "philearley:master" -h "philearley:release-$VERSION" -F "./release-file.txt" --assign "philearley"
/home/developer/go/src/github.com/github/hub/bin/hub pull-request --assign "philearley" -b "philearley:master" -h "philearley:release-$VERSION" -m "$RELEASE_TITLE" -m "" -m "$release_notes"
