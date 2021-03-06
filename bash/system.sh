# set up my editor
export EDITOR=vim

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
# Debian tweak
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# I like to keep all my history -- forever
export HISTSIZE=50000
export HISTCONTROL=erasedups
shopt -s histappend
export HISTIGNORE="exit:clear:reset"
