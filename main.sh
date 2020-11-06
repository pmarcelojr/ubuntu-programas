#!/usr/bin/env bash

## Saia ao Primeiro Erro
set -e
## Removendo eventuais travas do apt ##
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

export vermelho="\e[1;31m"
export verde="\e[1;32m"
export corlogo="\033[1;34m"

DIR_DOWNLOADS="$HOME/Downloads/programas"

apt_pacotes=(curl unzip apt-transport-https ca-certificates software-properties-common golang snapd gnome-sushi telegram-desktop zsh awscli vim traceroute)

### Arquivos deb ###
URL_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_TEAMS="https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.25560_amd64.deb"
URL_ZOOM="https://zoom.us/client/latest/zoom_amd64.deb"
URL_DEVDOCS="https://github.com/egoist/devdocs-app/releases/download/v0.7.1/DevDocs_0.7.1_amd64.deb"

### Arquivos zip ###
TER_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`
URL_TERRAFORM="https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip"

snaps=(spotify postman)
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
    sudo apt update
    echo -e "${verde}*-- Mostrando as Atualizações do Sistema... --*"
    sudo apt list --upgradable
    echo -e "${verde}*-- Instalando Atualizações do Sistema... --*"
    sudo apt upgrade -y
}


## ----- A partir daqui o script irá trabalhar com as configurações ------ ##

### Instalação de Programas ###
for nome_app in ${apt_pacotes[@]};
do
    if ! dpkg -l | grep -q $nome_app;
    then
        sudo apt install -y "$nome_app"
        check_sucessful
    else
        echo -e $verde "[INSTALADO] - $nome_app"
    fi
done

### Instalação de Programas com Snap ###
for nome_snap in ${snaps[@]};
do
    if ! snap list | grep -q $nome_snap;
    then
        sudo snap install $nome_snap
        check_sucessful
    else
        echo -e $verde "[INSTALADO] - $nome_snap"
    fi
done

### Instalação de Programas com Snap --classic ###
for nome_app in ${snaps_classic[@]};
do
    if ! snap list | grep -q $nome_app;
    then
        sudo snap install --classic $nome_app
        check_sucessful
    else
        echo -e $verde "[INSTALADO] - $nome_snap"
    fi
done

### Atualizando arquivo ~/.profile com variaveis GOLANG ###
echo export GOPATH=$HOME/go >> ~/.profile
echo export PATH=$PATH:$GOPATH/bin >> ~/.profile
echo export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin >> ~/.profile
echo export PATH=~/.local/bin:$PATH >> ~/.profile
. ~/.profile

atualizar

### Downloads programas .deb ###
mkdir $DIR_DOWNLOADS
wget -c $URL_CHROME -P $DIR_DOWNLOADS
wget -c $URL_TEAMS -P $DIR_DOWNLOADS
wget -c $URL_ZOOM -P $DIR_DOWNLOADS
wget -c $URL_DEVDOCS -P $DIR_DOWNLOADS

### Instalação programas baixados ###
sudo apt install $DIR_DOWNLOADS/*.deb

### Limpando pastas temporaria ###
sudo rm $DIR_DOWNLOADS/*.* -f

### Instalando Terraform ###
echo -e $verde "INSTALL TERRAFORM $TER_VER"
wget -c $URL_TERRAFORM
unzip terraform_${TER_VER}_linux_amd64.zip
sudo mv terraform /usr/local/bin
terraform --version
rm -rf terraform_${TER_VER}_linux_amd64.zip

### Instalando Docker ###
echo -e ${verde} "INSTALL DOCKER"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - # Adiciona chave GPG para repos
sudo apt-add-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" # Adiciona repositorio
atualizar # Atualiza Sistema
apt-cache policy docker-ce # Garantir que esta instalando a partir do docker
sudo apt install -y docker-ce
if ( systemctl -q is-active docker.service );
then
    docker -v
    echo "Apllication Docker is still running"
    check_sucessful
else
    sudo systemctl start docker.service
fi

### Procedimentos e Otimizações ### 
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false

### Finalização e Limpeza ###
sudo apt -y autoremove
sudo apt -y autoclean

echo -e $corlogo "+-----------------------------------+"
echo -e $corlogo "            ... FIM ...              "
echo -e $corlogo "+-----------------------------------+"