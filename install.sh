#!/bin/bash
# run me by typing ./install.sh
sudo echo Your are about to experience magic!

while true; do
	read -p "Are you Knorcedger? (y/n)" yn
	case $yn in
		[Yy]* ) y=1; break;;
		[Nn]* ) y=0; break;;
		* ) echo "Please answer yes or no.";;
	esac
done

# add software source keys and ppas
sudo add-apt-repository -y ppa:'webupd8team/atom' &> /dev/null
sudo wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
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

# install zsh and oh-my-zsh
sudo apt-get --assume-yes install zsh
sudo apt-get --assume-yes install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

# copy all dotfiles
mkdir dev
cd dev
git clone https://github.com/Knorcedger/dotfiles
/bin/cp -rf ~/dev/dotfiles/.zshrc ~
/bin/cp -rf ~/dev/dotfiles/.aliases ~
if [ "$y" = "1" ]
then
	/bin/cp -rf ~/dev/dotfiles/.gitconfig ~
fi

# install node
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get --assume-yes install nodejs
sudo apt-get --assume-yes install npm

# create a symbolic link for node (by default uses nodejs)
sudo ln -s /usr/bin/nodejs /usr/bin/node

# upgrade npm as well
npm install npm -g

# install some npm modules
npm install -g gulp
npm install -g cca
npm install -g bower
npm install -g eslint
npm install -g eslint-cli
npm install -g node-inspector --unsafe-perm
npm install -g fixpack
npm install -g npm-check-updates
npm install -g package-json-to-readme
npm install -g yo

wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

apm install sync-settings

# restart the pc?
echo Awesome! Restart the PC now. Do something yourself ffs!
