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

#creating directories
$p "Creating directories\n"
mkdir ~/dev -v
mkdir ~/builds -v
mkdir ~/tmp -v
mkdir ~/software -v
mkdir -p /var/www/apps

$p "Installing packages\n"

#build essentials
$sagi build-essential

#git
$sagi git

#xclip
$sagi xclip

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
  ssh-keygen -t rsa -C "zorbash@hotmail.com"
  xclip -sel clip < ~/.ssh/id_rsa.pub
  $p "\nCopied the new key to clipboard\n"
  $p "Please paste it to github (go to https://github.com/settings/ssh)"
fi

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

#rxvt
$sagi rxvt

#terminator
$sagi terminator


#mrename - utility to mass rename files
$sagi mrename

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

#htop
$sagi htop

#pv
$sagi pv

#ack
$sagi ack-grep

#imagemagick
$sagi imagemagick

#postgres
psql='postgresql'
psqlv="$psql-9.1"
$sagi "$psqlv" "$psqlv-postgis" "$psql-common" "$psql-contrib-9.1"