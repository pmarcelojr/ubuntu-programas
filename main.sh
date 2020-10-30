#!/bin/bash

echo "*-* Verificando o Sistema por Atualizações... *-*"
if ! sudo apt update
then
    echo "Não foi possivel atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
fi
echo
echo "*-* Mostrando as Atualizações do Sistema... *-*"
#sudo apt list --upgradable
echo
echo "*-* Instalando Atualizações do Sistema... *-*"
#sudo apt upgrade -y
echo
echo "*-* Limpando o Sistema *-*"
#sudo apt clean
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