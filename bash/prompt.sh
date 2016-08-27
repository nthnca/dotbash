## Context sensitive aliases
# make all function variables local
# try not to run any non-native bash cmds... this has to execute a lot
# undo aliases of previous context
# set up new context sensitive aliases
__git_undo() {
    unalias br co ci st dif show push pull cid
}

__git_do() {
    local git_br

    read git_br < $1/.git/HEAD
    __pr_branch=${git_br##*refs/heads/}
    [ "$git_br" == "$__pr_branch" ] && __pr_branch="(no branch)"

    __pr_repo="${1##*/}"
    __pr_dir="${PWD##$1}"
    __undo_context=__git_undo

    alias br="git branch"
    alias co="git checkout"
    alias ci="git commit -v -a"
    alias cia="git commit --amend -v -a"
    alias cid="GIT_COMMITTER_DATE=\"$FAKE_DATE\" git commit -v --date=\"$FAKE_DATE\""
    alias st="git status"
    alias log="git log"
    alias dif="git diff -p"
    alias show="git show"
    alias push="git push origin :"
    alias pull="git fetch; git merge origin/$__pr_branch"
}

__git_dir() {
    local tmppath

    tmppath=$PWD
    while [ "$tmppath" != "" ]; do
        [ -d "$tmppath"/.git ] && __git_do "$tmppath" && return 0
        [ "${tmppath##*/}" == .git ] && return 1
        tmppath=${tmppath%/*}
    done
    return 1
}

__other_dir() {
    __pr_repo=
    __pr_branch=
    __pr_dir="${PWD/$HOME\//~/}"
    __undo_context=true
}

export DEPTH=$((DEPTH + 1))

__count_arguments() {
  echo $#
}

__stayawake_time=0

__stayawake () {
  if [ -z $LINUX ]; then
    return 1
  fi

  local time=$(printf "%(%s)T")
  if [ $__stayawake_time -lt $((time-120)) ]; then
    __stayawake_time=$time
    $DOTBASH/bin/stayawake
  fi
  return 1
}

__prompt_command() {
  __pr_error="-ERR$?"
  [ $__pr_error == "-ERR0" ] && __pr_error=""

  $__undo_context
  __git_dir || __other_dir  # add more as needed
  __stayawake

  __pr_jobs="-j$(__count_arguments `jobs -p`)"
  [ "$__pr_jobs" == "-j0" ] && __pr_jobs=""

  __pr_depth="-d$DEPTH"
  [ "$__pr_depth" == "-d1" ] && __pr_depth=""

  [ -n "$__pr_branch" ] && __pr_branch="[$__pr_branch]"
}

PROMPT_COMMAND=__prompt_command

# PS1 should look something like "[UNK-d6-j3-ERR1] g4146[branch]/foo/abc$
PS1='[\[\e[34m\]$SHORT_NAME\[\e[0m\]\[\e[31m\]$__pr_depth$__pr_jobs$__pr_error\[\e[0m\]] $__pr_repo\[\e[34m\]$__pr_branch\[\e[0m\]$__pr_dir$ '
