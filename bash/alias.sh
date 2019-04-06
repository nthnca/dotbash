# Helpful options for everyday commands.
alias cd='cd -P'
alias df='df -h'
alias rm='rm -i'

[ -n "$MACOSX" ] && alias ls='ls -GBh'
[ -n "$LINUX" ] && alias ls='ls --color=tty -Bh'

#alias rsync='rsync --stats' # -r recurse, -v verbose, -t preserve time
  # may need --modify-window=1 if rsyncing with FAT fs

# Sometimes you just need some extra whitespace, otherwise clear or reset.
alias white="echo;echo;echo;echo;echo;echo;echo"
