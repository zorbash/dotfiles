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

rspork() {
  rspec "$*" --drb;
}