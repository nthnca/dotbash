# Want this to run on every new prompt.
# Want this to run until one prompt command returns an error.
PROMPT_COMMANDS=__git_undo:$PROMPT_COMMANDS:__git_dir

## Context sensitive aliases
# make all function variables local
# try not to run any non-native bash cmds... this has to execute a lot
# undo aliases of previous context
# set up new context sensitive aliases
__git_undo() {
    if [ ! -z $__git_undo_true ]; then
      __git_undo_true=
      unalias br co ci st dif show push pull
    fi
}

__git_do() {
    local git_br

    read git_br < $1/.git/HEAD
    BRANCH_NAME=${git_br##*refs/heads/}
    [ "$git_br" == "$BRANCH_NAME" ] && BRANCH_NAME="(no branch)"

    REPO_NAME="${1##*/}"
    BRANCH_PATH="${PWD##$1}"
    __git_undo_true=true

    alias br="git branch"
    alias co="git checkout"
    alias ci="git commit -v -a"
    alias st="git status"
    alias log="git log"
    alias dif="git diff -p"
    alias show="git show"
    alias push="git push origin :"
    alias pull="git fetch; git merge origin/$BRANCH_NAME"
}

__git_dir() {
    local tmppath

    tmppath=$PWD
    while [ "$tmppath" != "" ]; do
        [ -d "$tmppath"/.git ] && __git_do "$tmppath" && return 1
        [ "${tmppath##*/}" == .git ] && return 0
        tmppath=${tmppath%/*}
    done
    return 0
}
