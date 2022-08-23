#!/bin/sh

if [ -d "_site" ];
then
    echo -e "${RED}Pushing to Neocities${NOCOLOR}"
    neocities push _site
fi
git add .
cz commit
cz changelog
mv CHANGELOG.md pages/CHANGELOG.md
#git push -f