# this script will run if the theme is selected by zsht
#

# XD
function LMOTD() {
  S_WIDTH=$(tput cols)
  echo ''
  [[ $(( $S_WIDTH >= 74 )) = 1 ]] && echo -n " __                                            "
  echo "                __         "
  [[ $(( $S_WIDTH >= 74 )) = 1 ]] && echo -n "/\\ \\                                           "
  echo "               /\\ \\        "
  [[ $(( $S_WIDTH >= 74 )) = 1 ]] && echo -n "\\ \\ \\          ___      __     ___     ___     "
  echo "  ____     ____\\ \\ \\___    "
  [[ $(( $S_WIDTH >= 74 )) = 1 ]] && echo -n " \\ \\ \\        / __\`\\  /'_ \`\\  / __\`\\ /' _ \`\\   "
  echo -n " /\\_ ,\`\\  /',__\\"; echo "\\ \\  _ \`\\  "
  [[ $(( $S_WIDTH >= 74 )) = 1 ]] && echo -n "  \\ \\ \\_____,/\\ \\L\\ \\/\\ \\L\\ \\/\\ \\L\\ \\/\\ \\/\\ \\  "
  echo -n " \\/_/  /_/\\__, \`\\"; echo "\\ \\ \\ \\ \\ "
  [[ $(( $S_WIDTH >= 74 )) = 1 ]] && echo -n "   \\ \\_______\\ \\____/\\ \\____ \\ \\____/\\ \\_\\ \\_\\ "
  echo "   /\\____\\/\\____/ \\ \\_\\ \\_\\"
  [[ $(( $S_WIDTH >= 74 )) = 1 ]] && echo -n "    \\/______/ \\/___/  \\/___L\\ \\/___/  \\/_/\\/_/ "
  echo "   \\/____/\\/___/   \\/_/\\/_/"
  [[ $(( $S_WIDTH >= 74 )) = 1 ]] && echo -n "                        /\\____/                "
  echo "                           "
  [[ $(( $S_WIDTH >= 74 )) = 1 ]] && echo -n "                        \\_/__/ "
  if [[ $(( $S_WIDTH >= 74 )) = 1 ]]; then
    LMOTD_DATE=$(date)
    LMOTD_DATE_C=${#LMOTD_DATE}
    LMOTD_DATE_FWC=$(echo $LMOTD_DATE | grep -o [年月日周時分秒一二三四五六日] | wc -l | sed 's/ //g')
    LMOTD_DATE_C=$(($LMOTD_DATE_C + $LMOTD_DATE_FWC))
    LMOTD_DATE_BC=$((43 - $LMOTD_DATE_C))
    LMOTD_DATE_B=' '
    for i in {2..$LMOTD_DATE_BC}; do
      LMOTD_DATE_B="$LMOTD_DATE_B "
    done
    echo "$LMOTD_DATE_B$LMOTD_DATE"
  fi

  echo ""
}

LMOTD
echo ""

# zsh syntax highlighting
if [[ -n $ZSH_HIGHLIGHT_HIGHLIGHTERS ]]; then
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor pattern)

  ZSH_HIGHLIGHT_STYLES[default]='none'
  ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
  ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
  ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
  ZSH_HIGHLIGHT_STYLES[function]='fg=green'
  ZSH_HIGHLIGHT_STYLES[command]='fg=green'
  ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
  ZSH_HIGHLIGHT_STYLES[commandseparator]='none'
  ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
  ZSH_HIGHLIGHT_STYLES[path]='bg=8,fg=yellow'
  ZSH_HIGHLIGHT_STYLES[path_prefix]='bg=8,fg=yellow'
  ZSH_HIGHLIGHT_STYLES[path_approx]='bg=8,fg=yellow'
  ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue'
  ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue'
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=10'
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=10'
  ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
  ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[assign]='none'

  ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=0,bg=5'
  ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='underline'
  ZSH_HIGHLIGHT_STYLES[bracket-level-1]='none'
  ZSH_HIGHLIGHT_STYLES[bracket-level-2]='none'
  ZSH_HIGHLIGHT_STYLES[bracket-level-3]='none'
  ZSH_HIGHLIGHT_STYLES[bracket-level-4]='none'

  ZSH_HIGHLIGHT_STYLES[cursor]='fg=15'

  ZSH_HIGHLIGHT_PATTERNS+=('add' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('am' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('apply' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('archimport' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('archive' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('bisect' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('blame' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('branch' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('bundle' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('cat-file' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('check-attr' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('check-ref-format' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('checkout' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('checkout-index' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('cherry' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('cherry-pick' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('citool' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('clean' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('clone' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('commit' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('commit-tree' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('config' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('count-objects' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('cvsexportcommit' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('cvsimport' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('cvsserver' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('daemon' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('describe' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('diff' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('diff-files' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('diff-index' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('diff-tree' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('difftool' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('fast-export' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('fast-import' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('fetch' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('fetch-pack' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('filter-branch' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('flow' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('fmt-merge-msg' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('for-each-ref' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('format-patch' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('fsck' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('gc' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('get-tar-commit-id' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('grep' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('gui' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('hash-object' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('help' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('http-backend' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('http-fetch' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('http-push' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('imap-send' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('index-pack' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('init' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('instaweb' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('log' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('ls-files' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('ls-remote' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('ls-tree' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('mailinfo' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('mailsplit' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('merge' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('merge-base' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('merge-file' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('merge-index' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('merge-one-file' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('merge-tree' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('mergetool' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('mktag' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('mktree' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('mv' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('name-rev' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('notes' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('pack-objects' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('pack-redundant' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('pack-refs' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('parse-remote' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('patch-id' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('prune' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('prune-packed' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('pull' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('push' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('quiltimport' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('read-tree' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('rebase' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('receive-pack' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('reflog' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('relink' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('remote' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('repack' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('replace' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('request-pull' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('rerere' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('reset' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('rev-list' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('rev-parse' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('revert' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('rm' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('send-email' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('send-pack' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('shell' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('shortlog' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('show' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('show-branch' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('show-index' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('show-ref' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('stash' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('status' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('stripspace' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('submodule' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('svn' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('symbolic-ref' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('tag' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('unpack-file' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('unpack-objects' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('update-index' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('update-ref' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('update-server-info' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('upload-archive' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('upload-pack' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('var' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('verify-pack' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('verify-tag' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('whatchanged' 'underline')
  ZSH_HIGHLIGHT_PATTERNS+=('write-tree' 'underline')

  ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
fi


