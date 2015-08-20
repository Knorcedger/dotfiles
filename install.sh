#!/bin/bash
# run me by typing ./install.sh
sudo echo Your are about to experience magic!

# add software source keys and ppas
sudo add-apt-repository -y ppa:'webupd8team/atom' &> /dev/null
sudo wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update

# lets install some ubuntu software
sudo apt-get --assume-yes install atom
sudo apt-get --assume-yes install google-chrome-unstable
sudo apt-get --assume-yes install git
sudo apt-get --assume-yes install filezilla
sudo apt-get --assume-yes install firefox
sudo apt-get --assume-yes install gthumb
sudo apt-get --assume-yes install skype
sudo apt-get --assume-yes install curl
# this is used to install node 0.12
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get --assume-yes install nodejs
sudo apt-get --assume-yes install npm

# create a symbolic link for node (by default uses nodejs)
sudo ln -s /usr/bin/nodejs /usr/bin/node

# upgrade npm as well
sudo npm install npm -g

# install some npm modules
sudo npm install -g gulp
sudo npm install -g cca
sudo npm install -g bower
sudo npm install -g node-inspector --unsafe-perm

sudo wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sudo sh

apm install sync-settings
