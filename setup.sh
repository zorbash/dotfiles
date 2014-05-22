#!/bin/bash

#aliases
sagi='sudo apt-get install -y'
sagu='sudo apt-get update -y'
p='echo -e'

#defaults
first_time=0
dotfiles=0

[ "$1" == "-h" ] && echo "usage: ./setup.sh [-h:help][-u:update]" && exit
[ "$1" == "-u" ] && $sagu

[ "$1" == "--first-time" ] && first_time=1
[ "$1" == "--dotfiles" ] && dotfiles=1

#creating directories
$p "Creating directories\n"
mkdir ~/dev -v
mkdir ~/builds -v
mkdir ~/tmp -v
mkdir ~/software -v

$p "Installing packages\n"

#build essentials
$sagi build-essential

#git
$sagi git
## initialize git config
if [[ $first_time == 1 ]]; then
  $p "Configuring git.."
  $p "enter git username:"
  read git_username

  $p "enter git email:"
  read git_email

  git config --global user.name $git_username
  git config --global user.email $git_email

  git config --global core.editor vim
  git config --global color.ui true

  git config --global alias.co checkout
  git config --global alias.br branch
  git config --global alias.ci commit
  git config --global alias.st status
  git config --global alias.unstage 'reset HEAD --'

  $p "\n Generating ssh keys\n"
  ssh-keygen -t rsa -C "me@zorbash.com"
  xclip -sel clip < ~/.ssh/id_rsa.pub
  $p "\nCopied the new key to clipboard\n"
  $p "Please paste it to github (go to https://github.com/settings/ssh)"
fi

#gitk
$sagi gitk

#git-gui
$sagi git-gui

#tig
$sagi tig

#github-cli
$sagi github-cli

#gitstats
$sagi gitstats

#openssl
$sagi openssl

#sqlite3
$sagi sqlite3

# mailutils (mail command)
$sagi mailutils

#change kb layout command
$sagi x11-xkb-utils

#locate command
$sagi locate

#light-dm
$sagi lightdm

#arandr
$sagi arandr

#rxvt
$sagi rxvt

#terminator
$sagi terminator

#lightweight text editor
$sagi leafpad

#mrename - utility to mass rename files
$sagi mrename

# events calendar
$sagi pal

# todos
$sagi calcurse

#zsh
$sagi zsh
if [ $first_time -eq 1 ]; then
  wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
  chsh --shell $(which zsh)

fi

#curl
$sagi curl

#tree
$sagi tree

#vim
$sagi vim
#install vim's plugins

#meld
$sagi meld

#htop
$sagi htop

#thunar
$sagi thunar

#mc
$sagi mc

#nethogs
$sagi nethogs

$sagi xterm
$sagi xinit

#iotop
$sagi iotop

$sagi graphviz

#pv
$sagi pv

#gimp
$sagi gimp

# For rmagick
$sagi graphicsmagick-libmagick-dev-compat libmagickwand-dev

$sagi wkhtmltopdf

#python essentials
$sagi python-pip python-dev

#howdoi
pip install howdoi

#aptitude
$sagi aptitude

# leisure stuff
$sagi toilet cowthink cowsay fortune fortune-mod mplayer jp2a

$sagi moc # Music

$sagi canto # RSS

#install zorbash's dotfiles
if [ $first_time -eq 1 ] || [ $dotfiles -eq 1 ]; then
  ./install_dotfiles.sh
fi

#sublime
if [ 1 == 0 ]; then
  sublime_latest='software/Sublime\ Text\ 2.0.1'
  cd ~/tmp && wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.1%20x64.tar.bz2 &&
  [ $! -eq 0 ] && tar -xjf ./Sublime\ Text\ 2.0.1\ x64.tar.bz2
  mv ./Sublime\ Text\ 2.0.1\ x64 ~/$sublime_latest
  cd ~
fi


#chrome
chrome_exists=$(which google-chrome)
if [ "$chrome_exists" == "" ]; then
  $sagi libxss1
  cd ~/tmp && wget https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb -O chrome.deb
  sudo dpkg -i chrome.deb
fi

#i3
$sagi i3

#weechat
$sagi weechat

#xclip
$sagi xclip

#node
node_exists=$(which node)
if [ "$node_exists" == "" ]; then
  $sagu
  $sagi python-software-properties python g++ make
  sudo add-apt-repository ppa:chris-lea/node.js
  $sagu
  $sagi nodejs
fi

#ack
$sagi ack-grep

$sagi xscreensaver unicode-screensacer xscreensaver-gl-extra
$sagi rss-glx
$sagi xscreensaver-data-extra

#feh wallpaper utility
$sagi feh

# gif recording tty sessions
$sagi imagemagick ttyrec
git clone https://github.com/icholy/ttygif.git
cd ttygif
make


#ag
ag_exists=$(which ag)
if [ "$ag_exists" == "" ]; then
  $sagi automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
  cd ~/builds && git clone https://github.com/ggreer/the_silver_searcher.git
  cd ./the_silver_searcher
  ./build.sh
  sudo make install
fi

#skype
skype_exists=$(which skype)
if [ "$skype_exists" == "" ]; then
  cd ~/tmp
  if [ -f "skype.deb" ]; then
    wget http://download.skype.com/linux/skype-ubuntu-precise_4.1.0.20-1_i386.deb -O skype.deb
  fi
  $sagi libasound2 libc6 libgcc1 libqt4-dbus libqt4-network libqt4-xml libqtcore4 libqtgui4 libqtwebkit4 libstdc++6 libx11-6 libxext6 libxss1 libxv1 libssl1.0.0
  sudo dpkg -i ./skype.deb
fi

#haskell
$sagi haskell-platform

#erlang
$sagi erlang erlang-doc

#rust
cd ~/tmp
git clone https://github.com/mozilla/rust.git
cd rust
./configure
make && sudo make install

#install node packages
snig='sudo npm install -g'
$snig nodemon coffee-script express stylus socket.io sqlite3 mocha chai should
expect.js underscore node-inspector nodev npm toffee eco gumba

#postgres
psql='postgresql'
psqlv="$psql-9.1"
$sagi "$psqlv" "$psqlv-postgis" "$psql-common" "$psql-contrib-9.1"
