#!/usr/bin/env bash

## Saia ao Primeiro Erro
set -e
## Removendo eventuais travas do apt ##
#sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

export vermelho="\e[1;31m"
export verde="\e[1;32m"
export corlogo="\033[1;34m"

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

echo -e ${verde} "*-* Verificando o Sistema por Atualizações... *-*"
if ! sudo apt update
then
    echo -e "${vermelho}Não foi possivel atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
fi

TER_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`

apt_pacotes=(git curl unzip pyhton3-pip apt-transport-https ca-certificates software-properties-common golang snapd gnome-sushi telegram-desktop zsh awscli vim traceroute)

repositorios=(
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
)

downloads=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip"
    "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb -O teams.deb"
    "https://zoom.us/client/latest/zoom_amd64.deb -O zoom.deb"
)

snaps=(spotify)
snaps_classic=(code kubectl)

## ----- A partir daqui o script irá trabalhar com as configurações ------ ##

# CONFIG MOSTRA % BATERIA 
gsettings set org.gnome.desktop.interface show-battery-percentage true

# entra na pasta de diretorios e arquivos temporarios
cd $(mktemp -d)
pwd
# baixa arquivos necessarios
wget -c ${downloads[@]}
#apt-key add ${chaves[@]}
# Adiciona suporte a 32 bits && Atualiza repos
sudo dpkg --add-architecture i386
sudo apt update

sudo apt install ./*.deb

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

sudo apt update
echo
echo -e "${verde}*-* Mostrando as Atualizações do Sistema... *-*"
sudo apt list --upgradable
echo
echo -e "${verde}*-* Instalando Atualizações do Sistema... *-*"
sudo apt upgrade -y

echo -e $corlogo "+-----------------------------------+"
echo -e $corlogo "            ... FIM ...              "
echo -e $corlogo "+-----------------------------------+"