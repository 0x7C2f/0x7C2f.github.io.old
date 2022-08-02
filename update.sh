#!/bin/sh
git submodule foreach git pull
git submodule update --init --recursive

if [ -d "_site" ];
then
    echo -e "${RED}Pushing to Neocities${NOCOLOR}"
    neocities push _site
fi
git add .
cz commit
git push -f
rake changelog