# vim: set ft=sh:

# What type of system are we running on?
[ -d /etc/mach_init.d ] && MACOSX=1
[ -f /etc/lsb-release ] && LINUX=1

# If this isn't an interactive shell now is the time to bail.
[ -z "$PS1" ] && return

# DOTBASH should already be set prior to loading this file.
for file in $DOTBASH/bash/*; do
  . $file
done
