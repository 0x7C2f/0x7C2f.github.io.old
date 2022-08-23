#!/bin/sh

if [ -d "_site" ];
then
    echo -e "${RED}Pushing to Neocities${NOCOLOR}"
    neocities push _site
fi
git add .
cz commit
cz changelog
sed -i -e '1i---
layout: page
title: Dotfiles
permalink: /dotfiles/
---\' CHANGELOG.md
mv CHANGELOG.md pages/CHANGELOG.md
#git push -f