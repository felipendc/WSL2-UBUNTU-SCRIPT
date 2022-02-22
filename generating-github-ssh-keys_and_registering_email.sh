#!/bin/bash
# Script automated by Felipe Ndc 


# Doing the MAGIC under the hood:
ssh-keygen -t ed25519 -C "felipendc10@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Getting the generated SSH key:
echo " "
echo "==============================================================="
echo "1) Copy the below key and go to: GITHUB - 'settings/SSH and GPG keys'"
echo "2) Click the 'New SSH key' button:"
echo "3) Then, give it a title and paste the key in the key field."
echo ""===============================================================""
echo " "

# Registering my personal email:
git config --global user.name "felipendc"
git config --global user.email "felipendc10@gmail.com"

# Copy Github generated key:
cat ~/.ssh/id_ed25519.pub

# Close script after user presses any key:
read -p 'Hit ENTER to exit'
