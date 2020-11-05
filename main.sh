#!/usr/bin/env bash

## Saia ao Primeiro Erro
set -e
## Removendo eventuais travas do apt ##
#sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

export vermelho="\e[1;31m"
export verde="\e[1;32m"
export corlogo="\033[1;34m"

DIR_DOWNLOADS="$HOME/Downloads"

TER_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`

apt_pacotes=(curl unzip pyhton3-pip apt-transport-https ca-certificates software-properties-common golang snapd gnome-sushi telegram-desktop zsh awscli vim traceroute)

repositorios=(
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
)

URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_TEAMS="https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb -O teams.deb"
URL_ZOOM="https://zoom.us/client/latest/zoom_amd64.deb -O zoom.deb"
URL_TERRAFORM="https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip"

snaps=(spotify)
snaps_classic=(code kubectl)

check_sucessful() {
  if [ $? != 0 ];
  then
    echo "Error Execution"
    exit 1
  fi
}

echo -e $corlogo "+-----------------------------------+"
echo -e $corlogo "  _   _ _                 _          "
echo -e $corlogo " | | | | |__  _   _ _ __ | |_ _   _  "
echo -e $corlogo " | | | | '_ \| | | | '_ \| __| | | | "
echo -e $corlogo " | |_| | |_) | |_| | | | | |_| |_| | "
echo -e $corlogo "  \___/|_.__/ \__,_|_| |_|\__|\__,_| "
echo -e $corlogo "                      PÓS INSTALAÇÃO "
echo -e $corlogo "                      MARCELO SANTOS "
echo -e $corlogo "   marcelosantostecnologia@gmail.com "
echo -e $corlogo "+-----------------------------------+"
sleep 2

# if [ "$USER" = "root" ]
# then
#     echo ""
# else
#     echo -e ${vermelho} "Você precisa ser o ROOT. Abortar."
#     exit 1
# fi

atualizar(){
    apt update
    echo -e "${verde}*-- Mostrando as Atualizações do Sistema... --*"
    sudo apt list --upgradable
    echo -e "${verde}*-- Instalando Atualizações do Sistema... --*"
    sudo apt upgrade -y
}


## ----- A partir daqui o script irá trabalhar com as configurações ------ ##

# CONFIG MOSTRA % BATERIA 
gsettings set org.gnome.desktop.interface show-battery-percentage true

#apt-key add ${chaves[@]}
# Adiciona suporte a 32 bits && Atualiza repos
sudo dpkg --add-architecture i386
sudo apt update

echo -e "${verde}*-* INSTALL TERRAFORM ${TER_VER} *-*"
unzip terraform_${TER_VER}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform --version
rm -rf terraform_${TER_VER}_linux_amd64.zip
rm -rf ./*.deb
cd ~

sudo apt install ${pacotes_apt[@]} -y

echo -e "${verde}*-* INSTALL DOCKER-ce *-*"
# Adiciona a chave GPG para o repos do docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Adiciona o Repositorio
for repositorios in ${repositorios[@]};; do
    apt-add-repository "$repositorio" -y
done
sudo apt update
# garantir que esta sendo instalado a partir do docker
apt-cache policy docker-ce
# install docker
sudo apt install -y docker-ce
#docker -v

# adicione no arquivo ~/.profile
echo export GOPATH=$HOME/go >> ~/.profile
echo export PATH=$PATH:$GOPATH/bin >> ~/.profile
echo export PATH=$PATH:GOPATH/bin:/usr/local/go/bin >> ~/.profile
echo export PATH=~/.local/bin:$PATH >> ~/.profile
. ~/.profile

echo
echo "*-* Instalando Shel Zsh e Oh-my-zsh *-*"
#zsh --version
#sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Realizando backup do arquivo de configuração original"
#cp ~/.zshrc ~/.zshrc.orig
echo "Altere o tema padrao para o gallois"
# Plugins = git / colored-man-pages / golang / terraform
#nano ~/.zshrc
echo "Altere o arquivo /bin/bash por /bin/zsh"
#sudo nano /etc/passwd

sudo snap install ${snaps[@]}
sudo snap install --classic ${snaps_classic[@]}

atualizar

echo -e $corlogo "+-----------------------------------+"
echo -e $corlogo "            ... FIM ...              "
echo -e $corlogo "+-----------------------------------+"