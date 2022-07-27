#!/bin/sh
RED='\033[0;31m'
NOCOLOR='\033[0m'

if [ -d "_site" ];
then
    echo -e "${RED}Pushing to Neocities"
    neocities push _site
fi
if [ -f ".git/index.lock" ];
then
    echo -e "${RED}Removing Git lock"
    rm -f .git/index.lock
fi
echo -e "${RED}Adding unwatched files"
git add .
echo -e "${RED}Parsing and Committing"
LANG=C git -c color.status=false status \
| sed -n -r -e '1,/Changes to be committed:/ d' \
            -e '1,1 d' \
            -e '/(use "git restore --staged <file>..." to unstage)/d' \
            -e '/^Untracked files:/,$ d' \
            -e 's/^\s*//' \
            -e '/./p' \
| git commit -F -
echo -e "${RED}Pushing to repo and creating pull request"
git push \
-o merge_request.create \
-o merge_request.remove_source_branch \
origin HEAD:gh-pages
echo -e "${RED}Updating changelog.md"
rake changelog