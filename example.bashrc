# vim: set ft=sh:

# In order to install this bashrc file:
# cp example.bashrc ~/.bashrc; ln ~/.bashrc ~/.bash_profile

# DOTBASH is the path to the dotbash repository.
DOTBASH="$HOME/github/dotbash/"

# Nice short name for this computer.
SHORT_NAME="UNKNOWN"

# Multiple Chrome profiles? Add here, creates commands like startprof1chrome.
CHROME_USERS="prof1 prof2 prof3"

# If you have multiple repositories. Tools like rst use this.
REPO_PATHS="$HOME/github" # $HOME/go/src/github.com/nthnca/"


# Don't modify the next line, make sure DOTBASH is defined correctly.
. "$DOTBASH/core.bashrc"
