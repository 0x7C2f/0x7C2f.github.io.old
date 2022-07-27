#!/bin/sh
if [ -d "_site" ];
then
    echo -e "${RED}Pushing to Neocities${NOCOLOR}"
    neocities push _site
fi
git add .
cz
git push -f origin HEAD:gh-pages
rake changelog