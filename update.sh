#!/bin/sh

if [ -d "_site" ];
then
    echo -e "${RED}Pushing to Neocities${NOCOLOR}"
    neocities push _site
fi
git add .
cz commit
cz bump
#if [ -f "CHANGELOG.md" ];
#then
#    mv CHANGELOG.md pages/CHANGELOG.md
#fi
git push -f