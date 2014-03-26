# vim:ft=zsh ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://gist.github.com/1595572).
#
# In addition, I recommend the
# [Solarized theme](https://github.com/altercation/solarized/) and, if you're
# using it on Mac OS X, [iTerm 2](http://www.iterm2.com/) over Terminal.app -
# it has significantly better color fidelity.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. Like most
# prompts, it will only show git information when in a git working directory.
# However, it goes a step further: everything from the current user and
# hostname to whether the last call exited with an error to whether background
# jobs are running in this shell will all be displayed automatically when
# appropriate.

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
SEGMENT_SEPARATOR='⮀'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

if [[ $(uname) == "Darwin" ]]; then
  MAC_COMPUTERNAME=$(scutil --get ComputerName | sed "s/MacBook Pro /MBP/g" | sed "s/MacBook Air /MBA/g" | sed "s/ 的 /'s_/g" | sed "s/${USER}'s_//g")
fi

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=$(whoami)
  current_group=$(groups | sed 's/ .*//g')
  if [[ $current_group != $USER && $current_group != "staff" && $current_group != "users" ]]; then
    user="$user:$current_group"
  fi
  if [[ $(uname) == "Darwin" ]]; then
    BUILT_PROMPT="$BUILT_PROMPT $user@$MAC_COMPUTERNAME  "
    prompt_segment black default "%(!.%{%F{yellow}%}.)$user@$MAC_COMPUTERNAME"
  else
    BUILT_PROMPT="$BUILT_PROMPT $user@%m  "
    prompt_segment black default "%(!.%{%F{yellow}%}.)$user@%m"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  local ref dirty
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    ZSH_THEME_GIT_PROMPT_DIRTY='±'
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev | head -n1 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi

    BUILT_PROMPT="$BUILT_PROMPT ${ref/refs\/heads\//⭠ }$dirty  "
    echo -n "${ref/refs\/heads\//⭠ }$dirty"
  fi
}

# Dir: current working directory
prompt_dir() {
  T="$(pwd | sed "s*$HOME*~*g")"
  I=$(echo "$T" | grep -o '/' | wc -l | sed 's/ //g')
  if [[ $(expr "$(expr ${#BUILT_PROMPT} + ${#T} + 23) < $SCREEN_WIDTH") -eq 0 ]]; then
    T=$(echo "$T" | sed 's/\/[^\/]*\//\/...\//2')
    while [[ $(expr "$(expr ${#BUILT_PROMPT} + ${#T} + 23) < $SCREEN_WIDTH") -eq 0 && $(expr "$I > 1" ) -eq 1 ]]; do
      I=$(expr $I - 1)
      T=$(echo "$T" | sed 's/\/[.][.][.]\/[^\/]*\//\/...\//g')
    done
    BUILT_PROMPT="$BUILT_PROMPT $T  "
    prompt_segment blue black "$T"
  else
    BUILT_PROMPT="$BUILT_PROMPT $T  "
    prompt_segment blue black "$T"
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙" && BUILT_PROMPT="$BUILT_PROMPT J "
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘" && BUILT_PROMPT="$BUILT_PROMPT ! "
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡" && BUILT_PROMPT="$BUILT_PROMPT S "

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

prompt_clear() {
  if [[ $(expr "$(($SCREEN_WIDTH - ${#BUILT_PROMPT})) >= 18") -eq 1 ]]; then
    prompt_segment black 8 "%D %*"
  else
    prompt_segment black 8 ""
  fi
}

## Main prompt
build_prompt() {
  RETVAL=$?
  BUILT_PROMPT=''
  SCREEN_WIDTH=$(tput cols)

  prompt_context
  prompt_status
  prompt_dir

  prompt_git

  prompt_clear
  prompt_end
}

PROMPT='
%{%f%b%k%}$(build_prompt)
 %(!.#.$) '

function rprompt_git_status() {
  if [[ "$ZSH_GIT" != "off" ]]; then
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
      dirty=$(parse_git_dirty)
      LAST_COMMIT_TIME=$(git log -1 --pretty=format:'%ar' | sed 's/second/sec/g' | sed 's/minute/min/g' | sed 's/hour/hr/g')
      if [[ -n $dirty ]]; then
        echo -n 'Git:'
        FILECHANGE=$(git diff --shortstat | grep -o -e "[^ ]* file" | sed "s/ file//g")
        echo -n "$FILECHANGE"
        INSERTIONS=$(git diff --shortstat | grep -o -e "[^ ]* insertion" | sed "s/ insertion//g")
        DELETIONS=$(git diff --shortstat | grep -o -e "[^ ]* deletion" | sed "s/ deletion//g")
        [[ ! -n $INSERTIONS ]] && INSERTIONS='0'
        [[ ! -n $DELETIONS ]] && DELETIONS='0'
        INSERTIONS_ORG="$INSERTIONS"
        DELETIONS_ORG="$DELETIONS"
        if [[ $(($INSERTIONS + $DELETIONS > 10)) -eq 1 ]]; then
          B=$(($INSERTIONS + $DELETIONS))
          INSERTIONS=$(($INSERTIONS * 10 / $B))
          DELETIONS=$(($DELETIONS * 10 / $B))
        fi
        [[ $(($INSERTIONS < 1)) -eq 1 && $(($INSERTIONS_ORG > 0)) -eq 1 ]] && INSERTIONS='1'
        [[ $(($DELETIONS < 1)) -eq 1 && $(($DELETIONS_ORG > 0)) -eq 1 ]] && DELETIONS='1'
        if [[ $(($INSERTIONS > 0)) -eq 1 ]]; then
          for i in {1..$INSERTIONS}; do
              echo -n "%{%F{green}%}▣%{%f%}"
          done
        fi
        if [[ $(($DELETIONS > 0)) -eq 1 ]]; then
          for i in {1..$DELETIONS}; do
              echo -n "%{%F{red}%}▣%{%f%}"
          done
        fi
        LAST_COMMIT_TIME=$(echo $LAST_COMMIT_TIME | sed 's/ ../&@/' | sed 's/@.*//' | sed 's/ //')
        echo -n "%{$FG[008]%} ($LAST_COMMIT_TIME)"
      else
        # COMMIT_NAME=$(git symbolic-ref -q --short HEAD)
        # [[ ! -n $COMMIT_NAME ]] && COMMIT_NAME=$(git rev-parse HEAD | cut -c1-7)
        COMMIT_NAME=$(git rev-parse HEAD | cut -c1-7)
        echo "Git:$(git config --get user.name)@[$COMMIT_NAME] $LAST_COMMIT_TIME"
      fi
    fi
  else
    echo "Git:status-disabled"
  fi
}

function rprompt_rvm_status() {
  RVM_INFO=$(rvm_prompt_info | sed "s/(ruby-//g" | sed "s/)//g")
  if [[ $RVM_INFO != $DEFAULT_RVM ]]; then
    echo "⬥ $RVM_INFO"
  fi
}

function rprompt_nvm_status() {
  NVM_INFO=$(nvm_prompt_info)
  if [[ $NVM_INFO != $DEFAULT_NVM ]]; then
    echo "⬡ $NVM_INFO"
  fi
}

RPROMPT='%{$FG[008]%}$(rprompt_rvm_status) $(rprompt_nvm_status) $(rprompt_git_status)%{$reset_color%}'
