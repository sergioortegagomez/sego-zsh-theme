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
ZSH_THEME_DOCKER_PROMPT="%{$fg_bold[blue]%}Docker%{$reset_color%}"
ZSH_THEME_DOCKER_COLOR="%{$fg[blue]%}"

function get_git() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "%{$fg_bold[blue]%}[%{$fg_bold[yellow]%}${ref#refs/heads/}:$(git_prompt_short_sha)$(git_prompt_status)%{$fg_bold[blue]%}]%{$reset_color%}"
  fi
}


function get_docker_host() {   
  local _docker="$DOCKER_HOST" 
  local _docker_remote="%{$fg_bold[$ZSH_THEME_DOCKER_COLOR]%}$_docker%{$reset_color%}"
  local _docker_status="$_docker_remote" 

  if [[ "$_docker" ]]; then 
    echo "%{$fg_bold[blue]%}[%{$fg_bold[green]%}$ZSH_THEME_DOCKER_PROMPT{$fg[green]%}$_docker_status%{$fg_bold[blue]%}]%{$reset_color%}"  
  fi
  
}

function get_date() {
   echo "%{$fg_bold[blue]%}[%b%{$fg[yellow]%}%D{"%Y-%m-%d %I:%M:%S"}%b%{$fg_bold[blue]%}]%{$reset_color%}"
}

function get_user_machine() {
    echo "%{$fg_bold[blue]%}[%{$fg_bold[green]%}%n%b%{$fg[green]%}@%{$fg[green]%}%m%{$fg_bold[blue]%}]%{$reset_color%}"
}


# PROMPT=$'%{$fg_bold[blue]%}┌─[%{$fg_bold[green]%}%n%b%{$fg[black]%}@%{$fg[cyan]%}%m%{$fg_bold[blue]%}]%{$reset_color%} - %{$fg_bold[blue]%}[%{$fg_bold[white]%}%~%{$fg_bold[blue]%}]%{$reset_color%} - %{$fg_bold[blue]%}[%b%{$fg[yellow]%}'%D{"%Y-%m-%d %I:%M:%S"}%b$'%{$fg_bold[blue]%}]
# %{$fg_bold[blue]%}└─[%{$fg_bold[magenta]%}%?$(retcode)%{$fg_bold[blue]%}] <$(mygit)$(hg_prompt_info)>%{$reset_color%} '


PROMPT=$'%{$fg_bold[blue]%}┌─$(get_user_machine)$(get_date)$(get_git)$(get_docker_host)
%{$fg_bold[blue]%}└─%{$fg_bold[blue]%}[%{$fg_bold[white]%}%~%{$fg_bold[blue]%}]%{$reset_color%}%{$reset_color%} '
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

