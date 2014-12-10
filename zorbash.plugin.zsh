alias l='ls -laFh'

alias b='bundle exec'
alias br='bundle exec rake'
alias rs='b rails server'
alias rc='b rails console'
alias rcs='rc --sandbox'

alias pkgfind='dpkg-query -l | grep -i'

alias ga='git add'
alias gap='git add --patch'
alias gdc='git diff --cached'

alias grc='git rebase --continue'
alias gru='git show `cat .git/rebase-merge/stopped-sha`'
alias gra='git rebase --abort'
alias gu='git reset HEAD' #unstage
alias gcontains='git branch -a --contains='
alias grp='grep --color=always'
alias ggrp='git grep'

grih() {
  git rebase -i HEAD~$1
}

alias gr='git for-each-ref --sort=-committerdate refs/heads | head -n 10'

alias cps='rsync -a --stats --progress'

alias v='vim'

alias pms='sudo pm-suspend'

alias mp='mkdir -p'

rspork() {
  rspec --color "$*" --drb;
}

ase_mas() {
  echo "ase mas re $USER"
}

spy () { lsof -i -P +c 0 +M | grep -i "$1" }

alias lockme='i3lock'
alias xlockme='xscreensaver-command -lock'

alias del='rm -vrf'
alias proble='sudo nmap -sS -PN'

alias connections='lsof -i -n | grep ESTABLISHED'

alias rfind='find . -print0  | xargs -0 egrep -I'
alias external_ip='curl ifconfig.me'
alias benchmarkhdd='dd if=/dev/zero of=test bs=64k count=15k conv=fdatasync'

lsf() {
  l | awk '{print $5 " "  $9}'
}

find_broken_symlinks() {
  find $1 -type l -exec sh -c "file -b {} | grep -q ^broken" \; -print
}

#skroutz specific shortcuts
alias y="cd ~/dev/yogurt"

alias pserver="python -m SimpleHTTPServer"
alias rserver="ruby -run -ehttpd . -p8000"
alias gitsearch="git rev-list --all | xargs git grep -F"
alias ducks='du -cks *|sort -rn|head -11'
alias rspec='nocorrect rspec'
alias vms='VBoxManage list runningvms'
alias pryr="pry -r rails/console/app -r rails/console/helpers -e 'extend Rails::ConsoleMethods'"

# Use alsagain to increase the output volume over 100%
# usage example: alsagain 190%
alias alsagain='pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo'

alias bim='vim'

mcd() {
  mkdir -p "$1" && cd "$1";
}
