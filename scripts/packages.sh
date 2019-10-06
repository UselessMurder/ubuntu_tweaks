#!/bin/bash

wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb 

add-apt-repository universe
add-apt-repository ppa:longsleep/golang-backports
apt-get update
apt-get install apt-transport-https
apt-get update
apt -y install i3 vim-gtk3 ranger htop scrot xclip feh x11-xkb-utils net-tools build-essential cmake python3-dev libclang-dev golang-go nodejs npm rustc openjdk-8-jdk ctags dotnet-sdk-3.0 yapf yapf3 python3-flake8 python-flake8 pylint pylint3 virtualenv
