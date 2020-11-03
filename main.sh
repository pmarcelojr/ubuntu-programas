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
echo "*-* INSTALL GIT e Curl e Unzip *-*"
#sudo apt install -y git && curl && unzip && pyhton3-pip
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
echo "*-* INSTALL SPOTIFY *-*"
#sudo snap install spotify --classic
echo
echo "*-* INSTALL TERRAFORM 0.13.5 *-*"
#TER_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`
#wget https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip
#unzip terraform_${TER_VER}_linux_amd64.zip
#sudo mv terraform /usr/local/bin/
#terraform --version
#rm -rf terraform_0.13.5_linux_amd64.zip
echo
echo "*-* INSTALL DOCKER-ce *-*"
# adiciona pacotes necessarios
#sudo apt install -y apt-transport-https ca-certificates software-properties-common
# adiciona a chave GPG para o repos do docker
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# adiciona o repos
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#sudo apt update
# garantir que esta sendo instalado a partir do docker
#apt-cache policy docker-ce
# install docker
#sudo apt install -y docker-ce
#docker -v
echo
echo "*-* INSTALL KUBECTL *-*"
#sudo snap install kubectl --classic
#kubectl version --client
echo
echo "*-* INSTALL GOLANG *-*"
#sudo apt install golang -y
#go version
# adicione no arquivo ~/.profile
#export GOPATH=$HOME/go
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:GOPATH/bin:/usr/local/go/bin
#. ~/.profile
echo
echo "*-* INSTALL AWS CLI *-*"
#sudo pip3 install -y awscli
#aws --version
# adicione no arquivo ~/.profile
#export PATH=~/.local/bin:$PATH
echo
echo "*-* INSTALL TELEGRAM-DESKTOP *-*"
#sudo apt install telegram-desktop -y
echo "*-* INSTALL GNOME-SUSHI *-*"
#sudo apt install gnome-sushi -y
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
echo
echo "*-* Instalando Shel Zsh e Oh-my-zsh *-*"
#sudo apt install -y zsh
#zsh --version
#sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Realizando backup do arquivo de configuração original"
#cp ~/.zshrc ~/.zshrc.orig
echo "Altere o tema padrao para o gallois"
# Plugins = git / colored-man-pages / golang / terraform
#nano ~/.zshrc
echo "Altere o arquivo /bin/bash por /bin/zsh"
#sudo nano /etc/passwd