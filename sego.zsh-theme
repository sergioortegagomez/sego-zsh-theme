#
# SEGO ZSH THEME
#
# https://github.com/sergioortegagomez/sego-zsh-theme
#


ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}✱"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}✈"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

function get_git() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "%{$fg_bold[blue]%}[%{$fg_bold[yellow]%}${ref#refs/heads/}:$(git_prompt_short_sha)$(git_prompt_status)%{$fg_bold[blue]%}]%{$reset_color%}"
  fi
}

function get_docker() {
  if [ -f /.dockerenv ]; then
    echo "%{$fg_bold[blue]%}[%{$fg_bold[magenta]%}Docker%{$fg_bold[blue]%}]%{$reset_color%}"
  fi  
}

function get_date() {
   echo "%{$fg_bold[blue]%}[%b%{$fg[yellow]%}%D{"%Y-%m-%d %I:%M:%S"}%b%{$fg_bold[blue]%}]%{$reset_color%}"
}

function get_user_machine() {
    echo "%{$fg_bold[blue]%}[%{$fg_bold[green]%}%n%b%{$fg[green]%}@%{$fg[green]%}%m%{$fg_bold[blue]%}]%{$reset_color%}"
}

PROMPT=$'%{$fg_bold[blue]%}┌─$(get_user_machine)$(get_date)$(get_git)$(get_docker)
%{$fg_bold[blue]%}└─%{$fg_bold[blue]%}[%{$fg_bold[white]%}%~%{$fg_bold[blue]%}]%{$reset_color%} '
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

