# Repository commands.

if [ -z "${REPO_PATHS}" ]; then
  export REPO_PATHS=${DOTBASH}/..
fi

__dir_ls() {
  find $* -maxdepth 1 -mindepth 1 -type d
}

# List all the git repos in $DOTBASH/..
__repo_ls () {
  for dir in $(__dir_ls $REPO_PATHS); do
    [ -d "$dir"/.git ] || continue
    echo "$dir"
  done
}

# List all the git repos in $DOTBASH/.. that are tracking a remote repository.
__repo_ls_remote () {
  for dir in $(__repo_ls); do
    git -C "$dir" config --get remote.origin.url >/dev/null || continue
    echo "$dir"
  done
}

__repo_status () {
  for x in $(__repo_ls_remote); do
    echo "$x"
    git -C "$x" fetch &
  done

  wait
  echo "All repositories have been synced."

  local COLOR='\033[0;34m'
  local NO_COLOR='\033[0m'

  for dir in $(__repo_ls); do
    [ -d "$dir" ] || continue

    echo -e "${COLOR}$(cd "$dir"; pwd)...\033[0m"
    git -C "$dir" status -sb
    echo
    git -C "$dir" config --get remote.origin.url >/dev/null && \
        git -C "$dir" log origin/master..
    echo
  done
}

alias rpull='__repo_ls_remote | xargs -P 10 -I{} git -C {} pull;'
alias rpush='__repo_ls_remote | xargs -I{} git -C {} push;'
alias rst='__repo_status;'
alias rls='ls $DOTBASH/..'

# Set up aliases for all repositories.
for dir in $(__repo_ls); do
  eval "alias c$(basename $dir)='cd $(cd $dir; pwd)'"
done
