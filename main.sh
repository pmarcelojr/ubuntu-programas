#!/bin/bash

echo "*-* Verificando o Sistema por Atualizações... *-*"
#if ! sudo apt update
#then
#    echo "Não foi possivel atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
#    exit 1
#fi
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
echo
echo `Escolha uma plataforma de comunicação de video`
echo "[ 1 ] TEAMS"
echo "[ 2 ] ZOOM"
echo "[ 3 ] TEAMS & ZOOM"
echo "[ 4 ] Sair"
echo
echo -n "Qual a opção desejada? "
read OPCAO
case $OPCAO in
    1) echo "Instalando TEAMS"
        #wget "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb" -O teams.deb
        #sudo apt install -y ./teams.deb
        #rm -rf teams.deb
        ;;
    2) echo "Instalando ZOOM"
        #wget https://zoom.us/client/latest/zoom_amd64.deb -O zoom.deb
        #sudo apt install -y ./zoom.deb 
        #rm -rf zoom.deb
        ;;
    3) echo "Instalando TEAMS e ZOOM"
        echo "TEAMS"
        #wget "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb" -O teams.deb
        #sudo apt install -y ./teams.deb
        #rm -rf teams.deb
        echo "ZOOM"
        #wget https://zoom.us/client/latest/zoom_amd64.deb -O zoom.deb
        #sudo apt install -y ./zoom.deb 
        #rm -rf zoom.deb
        ;;
    4) echo "Saindo..."
        exit ;;
    *) "Opção desconhecida." ;
esac