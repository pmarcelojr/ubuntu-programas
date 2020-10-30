#!/bin/bash

echo "*-* UPDATE *-*"
#sudo apt update
clear
echo "*-* LIST --UPGRADABLE *-*"
#sudo apt list --upgradable
echo
echo "*-* UPGRADE *-*"
#sudo apt upgrade -y
echo
echo "*-* INSTALL GIT *-*"
#sudo apt install git
echo
echo "*-* CONFIG MOSTRA % BATERIA *-*"
#gsettings set org.gnome.desktop.interface show-battery-percentage true
echo
echo "*-* INSTALL CHROME *-*"
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo apt install ./google-chrome-stable_current_amd64.deb
#rm -rf google-chrome-stable_current_amd64
echo
echo "*-* INSTALL VISUAL STUDIO CODE *-*"
#sudo snap install --classic code