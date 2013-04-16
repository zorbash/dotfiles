alias sagi='sudo apt-get install -y'

#install essential packages (compilers etc..)
echo "\nInstalling essential packages\n"
sagi -y build-essential

#install zsh
echo "\nInstalling zsh\n"
sagi zsh

#make zsh the default shell
echo "\nSetting zsh as the default shell\n"
chsh -s /usr/bin/zsh

#install rvm
echo "\nInstalling rvm\n"
#curl -L  https://get.rvm.io | bash -s stable --rails --autolibs=enabled

#install node
echo "\nInstalling node\n"
