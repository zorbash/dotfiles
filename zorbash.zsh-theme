prompt_setup_zorbash(){
  separator='%K{237}%{$FG[200]%}  %{$reset_color%}'
  spear='%K{237}%{$FG[200]%} 𝝺 %{$reset_color%}'

  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%K{black}%{$fg[green]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  hostname='%K{black}%{$fg[cyan]%} %n %{$reset_color%}'
  directory='%K{black}%{$FG[215]%} %0~ %{$reset_color%}%{$fg[red]%}%{$reset_color%}'
  base_prompt="$hostname$separator$directory"

  base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")
  post_prompt_nocolor=$(echo "$post_prompt" | perl -pe "s/%\{[^}]+\}//g")

  precmd_functions+=(prompt_zorbash_precmd)
}

prompt_zorbash_precmd(){
  local gitinfo=$(git_prompt_info)
  local gitinfo_nocolor=$(echo "$gitinfo" | perl -pe "s/%\{[^}]+\}//g")
  local exp_nocolor="$(print -P \"$base_prompt_nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
  local prompt_length=${#exp_nocolor}

  local nl=""

  if [[ $prompt_length -gt 50 ]]; then
    nl=$'\n%{\r%}';
  fi
  PROMPT="$base_prompt$spear "
  RPROMPT="$gitinfo"
}

prompt_setup_zorbash
