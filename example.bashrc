# vim: set ft=sh:

# In order to install this bashrc file:
# cp example.bashrc ~/.bashrc; ln ~/.bashrc ~/.bash_profile

# DOTBASH is the path to the dotbash repository.
DOTBASH="$HOME/github/dotbash/"

# Nice short name for this computer.
SHORT_NAME="UNK"

# Multiple Chrome profiles? Add them here, creates commands like startXchrome.
CHROME_USERS="prof1 prof2 prof3"

# Feels like this should go somewhere else...
export GOPATH=$HOME/Library/go:$HOME/go


# Don't modify the next line, make sure DOTBASH is defined correctly.
. "$DOTBASH/core.bashrc"
