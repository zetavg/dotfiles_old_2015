# Neson's zsh theme


ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""


alias zsh-disgit='ZSH_GIT=off'
alias zsh-engit='ZSH_GIT=on'


function git_time_since_commit() {
  if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
    # Get the last commit.
    last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
    now=`date +%s`
    seconds_since_last_commit=$((now-last_commit))

    # Totals
    MINUTES=$((seconds_since_last_commit / 60))
    HOURS=$((seconds_since_last_commit/3600))

    # Sub-hours and sub-minutes
    DAYS=$((seconds_since_last_commit / 86400))
    SUB_HOURS=$((HOURS % 24))
    SUB_MINUTES=$((MINUTES % 60))

    # Echo
    echo "[${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m]"
  fi
}


function git_project_name() {
  if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
    echo `git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//'`
  fi
}


function is_git_dirty() {
  local SUBMODULE_SYNTAX=''
  if [[ $POST_1_7_2_GIT -gt 0 ]]; then
        SUBMODULE_SYNTAX="--ignore-submodules=dirty"
  fi
  if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]; then
    echo "dirty"
  else
    echo "clean"
  fi
}


function display_git_status() {
  if [[ "$ZSH_GIT" != "off" ]]; then
    if git rev-parse --git-dir > /dev/null 2>&1; then
    # Only proceed if there is actually a commit.
      echo "Git:$(git_project_name):$(git_prompt_info) $(git_time_since_commit)"
    fi
  else
    echo "[Git status disabled]"
  fi
}


PROMPT='
%{$FG[025]%}[%{$reset_color%}%{$FG[white]%}%~%{$FG[025]%}]%{$reset_color%} %(?..%{$fg[red]%}! )%{$reset_color%}%{$FG[white]%}%n@%M %{$FG[250]%}- %D %*%{$reset_color%}
 %(!.#.$)%{$reset_color%} '
RPROMPT='%{$FG[008]%}%p $(display_git_status) `git config --get user.name`%{$reset_color%}'


# See http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"
