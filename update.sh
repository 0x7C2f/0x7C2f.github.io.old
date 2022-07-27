#!/bin/sh
RED='\033[0;31m'
NOCOLOR='\033[0m'

if [ -d "_site" ];
then
    echo -e "${RED}Pushing to Neocities${NOCOLOR}"
    neocities push _site
fi
echo -e "${RED}Adding unwatched files${NOCOLOR}"
git add .
echo -e "${RED}Parsing and Committing${NOCOLOR}"
if [ -f ".git/index.lock" ];
then
    echo -e "${RED}Removing Git lock${NOCOLOR}"
    rm -f .git/index.lock
fi
LANG=C git -c color.status=false status \
| sed -n -r -e '1,/Changes to be committed:/ d' \
            -e '1,1 d' \
            -e '/(use "git restore --staged <file>..." to unstage)/d' \
            -e '/^Untracked files:/,$ d' \
            -e 's/^\s*//' \
            -e '/./p' \
| git commit -F -
echo -e "${RED}Pushing to repo and creating pull request${NOCOLOR}"
git push -f origin HEAD:gh-pages
hub pull-request --force --no-edit --head 0x7C2f:main
rake changelog