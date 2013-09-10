alias l='ls -laFh'

alias sser='sudo service'
alias b='bundle exec'
alias br='bundle exec rake'
alias rs='b rails server'
alias rc='b rails console'
alias rr='br routes'
alias rcs='rc --sandbox'

alias gfo='git fetch origin'
alias lol='git lol'
alias lola='git lola'

alias st2='sublime-text-2'

alias sagi='sudo apt-get install -y'
alias sagu='sudo apt-get update'
alias snig='sudo npm install -g'
alias pkgfind='dpkg-query -l | grep -i'

alias ga='git add'
alias gap='git add --patch'
alias gdc='git diff --cached'

alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gu='git reset HEAD' #unstage
grih () {
  git rebase -i HEAD~$1
}

alias cp='rsync -a --progress'
alias cps='rsync -a --stats --progress'

alias v='gvim'
alias grep='ag'

alias pms='sudo pm-suspend'

alias mp='mkdir -p'

rspork() {
  rspec --color "$*" --drb;
}

ase_mas() {
  echo "ase mas re $USER"
}

c() {
  less $1
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
alias gitsearch="git rev-list --all | xargs git grep -F"
alias ducks='du -cks *|sort -rn|head -11'

mcd() {
  mkdir -p "$1" && cd "$1";
}
