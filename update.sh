git add .
LANG=C git -c color.status=false status \
| sed -n -r -e '1,/Changes to be committed:/ d' \
            -e '1,1 d' \
            -e '/(use "git restore --staged <file>..." to unstage)/d' \
            -e '/^Untracked files:/,$ d' \
            -e 's/^\s*//' \
            -e '/./p' \
| git commit -F -
git push -f

github_changelog_generator \
    --user 0x7C2f \
    --project 0x7C2f.github.io \
    --output pages/changelog.md \
    --header-label "---
title: Changelog
layout: page
permalink: /changelog/
---"