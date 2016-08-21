# DOTBASH should already be set prior to loading this file.

# git needs its path, even in non-interactive shells.
tmp="/usr/local/git/bin"
if [ -d "$tmp" ]; then
  PATH="$PATH:$tmp"
fi

# If not running interactively, time to exit.
[ -z "$PS1" ] && return

export DEPTH=$((DEPTH + 1))

for file in $DOTBASH/bash/*; do
  . $file
done

# vim: set ft=sh:
