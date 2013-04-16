alias sser='sudo service'
alias b='bundle exec'
alias br='bundle exec rake'
alias rs='b rails server'
alias rr='br routes'
alias rcs='rc --sandbox'

alias gfo='git fetch origin'
alias gap='git add --patch'
alias lol='git lol'
alias lola='git lola'

alias st2='sublime-text-2'

alias sagi='sudo apt-get install -y'
alias sagu='sudo apt-get update'
alias pkgfind='dpkg-query -l | grep -i'

alias ga='git add'
alias gdc='git diff --cached'

alias v='vim'

rspork() {
  rspec "$*" --drb;
}

ase_mas() {
  echo "ase mas re $USER"
}
