#!/bin/bash

# github.com/felipendc

# Go back to the root (main) folder
cd ../

# checking if I have the latest files from github
echo "Checking for newer files online first"
git stash push --include-untracked
git pull
