#!/usr/bin/env bash

# Copyright (C) 2018 Harsh 'MSF Jarvis' Shandilya
# Copyright (C) 2018 Akhil Narang
# SPDX-License-Identifier: GPL-3.0-only

# Script to setup an AOSP Build environment on Ubuntu and Linux Mint

LATEST_MAKE_VERSION="4.3"

echo "Adding GitHub apt key and repository!"
sudo apt install software-properties-common -y
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages

sudo apt update
# Install lsb-core packages
sudo apt install lsb-core -y

# Install packages
sudo apt install git -y
sudo apt install libncurses5
sudo apt install libesd0-dev
sudo apt install gnupg -y
sudo apt install flex -y
sudo apt install bison-y
sudo apt install gperf -y
sudo apt install build-essential -y
sudo apt install zip -y
sudo apt install curl -y
sudo apt install zlib1g-dev -y
sudo apt install gcc-multilib -y
sudo apt install g++-multilib -y
sudo apt install libc6-dev-i386 -y
sudo apt install lib32ncurses5-dev -y
sudo apt install x11proto-core-dev -y
sudo apt install libx11-dev -y
sudo apt install lib32z-dev -y
sudo apt install lib32z1-dev -y
sudo apt install ccache -y
sudo apt install libgl1-mesa-dev -y
sudo apt install libxml2 -y
sudo apt install libxml2-utils -y
sudo apt install xsltproc -y
sudo apt install unzip -y
sudo apt install squashfs-tools -y
sudo apt install python -y
sudo apt install python-mako -y
sudo apt install libssl-dev -y
sudo apt install ninja-build -y
sudo apt install lunzip -y
sudo apt install syslinux -y
sudo apt install syslinux-utils -y
sudo apt install gettext -y
sudo apt install genisoimage -y
sudo apt install bc -y
sudo apt install xorriso -y
sudo apt install liblz4-tool -y
sudo apt install libncurses5-dev -y
sudo apt install libsdl1.2-dev -y
sudo apt install libwxgtk3.0-dev -y
sudo apt install lzop -y
sudo apt install maven -y
sudo apt install pngcrush -y
sudo apt install schedtool -y
sudo apt install lib32readline-dev -y
sudo apt install imagemagick -y
sudo apt install rsync -y
sudo apt install adb -y
sudo apt install autoconf -y
sudo apt install automake -y
sudo apt install axel -y
sudo apt install bc -y
sudo apt install clang -y
sudo apt install cmake -y
sudo apt install expat -y
sudo apt install fastboot -y
sudo apt install g++ -y
sudo apt install gawk -y
sudo apt install gcc -y
sudo apt install htop -y
sudo apt install libtinfo5 -y
sudo apt install libc6-dev -y
sudo apt install libcap-dev -y
sudo apt install libexpat1-dev -y
sudo apt install libgmp-dev -y
sudo apt install '^liblz4-.*' -y
sudo apt install '^liblzma.*' -y
sudo apt install libmpc-dev -y
sudo apt install libmpfr-dev -y
sudo apt install libncurses5-dev -y
sudo apt install libtool -y
sudo apt install '^lzma.*' -y
sudo apt install ncftp -y
sudo apt install ncurses-dev -y
sudo apt install patch -y
sudo apt install patchelf -y
sudo apt install pkg-config -y
sudo apt install pngquant -y
sudo apt install python2.7 -y
sudo apt install python-all-dev -y
sudo apt install re2c -y
sudo apt install schedtool -y
sudo apt install subversion -y
sudo apt install texinfo -y
sudo apt install w3m -y
sudo apt install xsltproc -y
sudo apt install lzip -y
sudo apt install libxml-simple-perl -y
sudo apt install libswitch-perl -y
sudo apt install apt-utils -y
sudo apt install gh -y
sudo apt install -y

sudo DEBIAN_FRONTEND=noninteractive \
    apt install ${PACKAGES} -y

echo -e "Setting up udev rules for adb!"
sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
sudo chmod 644 /etc/udev/rules.d/51-android.rules
sudo chown root /etc/udev/rules.d/51-android.rules
sudo systemctl restart udev

if [[ "$(command -v make)" ]]; then
    makeversion="$(make -v | head -1 | awk '{print $3}')"
    if [[ ${makeversion} != "${LATEST_MAKE_VERSION}" ]]; then
        echo "Installing make ${LATEST_MAKE_VERSION} instead of ${makeversion}"
        bash "$(dirname "$0")"/make.sh "${LATEST_MAKE_VERSION}"
    fi
fi

echo "Installing repo"
sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/local/bin/repo
