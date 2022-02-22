#!/bin/bash

# github.com/felipendc

# Go back to the root (main) folder
cd ../

# # It will print the output of the command "date"
output=$(date)

# Checking for any online updates first to synchronize the changes locally!
git pull

# Below command will backup everything inside the project folder
git add . 

# # This will print the date and the hour that this project was uploaded to github
git commit -m "Vicyos Rolling Update: ($output)"

#Send the local files to github
git push 

echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"

