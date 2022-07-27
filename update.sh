#!/bin/sh
if [ -d "_site" ];
then
    neocities push _site
fi
if [ -f ".git/index.lock" ];
then
    rm -f .git/index.lock
fi

git add .
LANG=C git -c color.status=false status \
| sed -n -r -e '1,/Changes to be committed:/ d' \
            -e '1,1 d' \
            -e '/(use "git restore --staged <file>..." to unstage)/d' \
            -e '/^Untracked files:/,$ d' \
            -e 's/^\s*//' \
            -e '/./p' \
| git commit -F -
git push \
-o merge_request.create \
-o merge_request.remove_source_branch \
origin HEAD:gh-pages
rake changelog