#!/bin/bash

# github.com/felipendc

# Go back to the root (main) folder
cd ../

git init
git config --global user.name "felipendc"
git config --global user.email "felipendc10@gmail.com"
sudo git config --system core.editor nano
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=25000'
git config --global push.default simple


echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"
