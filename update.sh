#!/bin/sh
# Update Submodules
git submodule update --init --recursive

# Check if _site exists (Used for neocities push while on phone.)
if [ -d "_site" ];
then
    echo -e "${RED}Pushing to Neocities${NOCOLOR}"
    neocities push _site
fi
git add .
cz commit
git push -f
rake changelog