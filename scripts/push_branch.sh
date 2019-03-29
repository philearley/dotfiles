
#!/bin/bash
set -x

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

hub push origin "$CURRENT_BRANCH"
hub pull-request -a "philearley" -b "philearley:master" -h philearley:"$CURRENT_BRANCH" -m "$1" -l "Targaryen,Pending Review"
