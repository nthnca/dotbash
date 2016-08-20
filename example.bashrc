# cp example.bashrc ~/.bashrc; ln ~/.bashrc ~/.bash_profile

# What type of system are we running on?
[ -d /etc/mach_init.d ] && MACOSX=1
[ ! -d /etc/mach_init.d ] && LINUX=1

# The following variables need to be localized for your system.
DOTBASH="$HOME/github/dotbash/"
SHORT_NAME="UNK"
CHROME_USERS="prof1 prof2 prof3"
FAKE_DATE="Sat Aug 20 9:00:00 EDT 2016"

# Don't modify the next line, make sure DOTBASH is defined correctly.
. "$DOTBASH/core.bashrc"

# vim: set ft=sh:
