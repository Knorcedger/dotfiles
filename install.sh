#!/bin/bash
# run me by typing ./install.sh
sudo echo Your are about to experience magic!

# add software source keys and ppas
sudo wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update

# lets install some ubuntu software
sudo snap install --classic --assume-yes atom
sudo snap install --classic --assume-yes skype
sudo apt-get --assume-yes install google-chrome-unstable
sudo apt-get --assume-yes install git
sudo apt-get --assume-yes install filezilla
sudo apt-get --assume-yes install firefox
sudo apt-get --assume-yes install gthumb
sudo apt-get --assume-yes install curl

# install zsh and oh-my-zsh
sudo apt-get --assume-yes install zsh
sudo apt-get --assume-yes install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

# copy all some dotfiles we might want to customize per machine
mkdir dev
cd dev
git clone https://github.com/Knorcedger/dotfiles
/bin/cp -rf ~/dev/dotfiles/.zshrc ~
/bin/cp -rf ~/dev/dotfiles/.gitconfig ~

# install nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

apm install sync-settings

# restart the pc?
echo Awesome! Restart the PC now. Do something yourself ffs!
