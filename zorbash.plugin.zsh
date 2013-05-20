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

alias v='vim'
alias grep='ag'

alias pms='sudo pm-suspend'

rspork() {
  rspec --color "$*" --drb;
}

ase_mas() {
  echo "ase mas re $USER"
}

c() {
  cat $1 | more
}

alias lockme='i3lock'
alias del='rm -vrf'

alias proble='sudo nmap -sS -PN'

lsf() {
  l | awk '{print $5 " "  $9}'
}
