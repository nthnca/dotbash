# set up the GOPATH
# export GOPATH=$HOME/Library/go:$HOME/go

# Add import go directories to PATH
export PATH=$PATH:$HOME/Library/go/bin
export PATH=$PATH:$HOME/go/bin

# Set up aliases for all go repositories.
for dir in $HOME/go/src/github.com/nthnca/*; do
  [ -d "$dir" ] || continue
  eval "alias c$(basename $dir)='cd $dir'"
done
