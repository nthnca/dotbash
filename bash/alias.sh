# helpful options for everyday commands
alias whoami="echo `/usr/bin/whoami`@`uname -n`"

alias vi='vim'
alias cd='cd -P'
alias df='df -h'
alias rm='rm -i'

alias srun='screen -D -RR -S a'
alias slist='screen -list'

alias rsync='rsync --stats -rvt' # -r recurse, -v verbose, -t preserve time
  # may need --modify-window=1 if rsyncing with FAT fs

[ -n "$MACOSX" ] && alias ls='ls -GBh'
[ -n "$LINUX" ] && alias ls='ls --color=tty -Bh'

alias white="echo;echo;echo;echo;echo;echo;echo"
