#!/bin/bash
# github.com/felipendc

# Refreshing the repo and upgrading the system:
sudo apt-get update && sudo apt-get upgrade

# Dependencies for android Building Development:
sudo apt install git-all

# Setting up Android Build Environment:
cd wsl-android-build-environment-setup
sudo chmod +x *.sh
./android_build_env.sh
./install_android_sdk.sh
cd ../

# Moving my personal .bashrc file to my HOME folder:
cd wsl-ubuntu-personal-bashrc && sudo cp -r .bashrc* ~/ && cd ../


# Setting Github email and nickname:
sudo chmod +x upall/*.sh && sudo sh ./upall/setup-git-v1.sh

# LOOKING FOR UPDATE FOR ALL THE PACKAGES:
sudo apt update
sudo apt upgrade -y
sudo apt install -f
sudo apt autoremove
