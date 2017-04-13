#PROMPT_COMMANDS=__undo:__git_dir:__stayawake
#PROMPT_COMMANDS=
REPO_NAME=
BRANCH_NAME=
BRANCH_PATH=

# Increment for each new bash shell.
export DEPTH=$((DEPTH + 1))

# Set up my context sensitive terminal prompt.
# PS1 will look something like "[UNK-d6-j3-ERR1] repo[branch]/foo/abc$"

# UNK is $SHORT_NAME, you should set this to your machines name.
# dx recursive bash instances (depth). When you run bash from inside bash.
# jx number of background tasks (jobs) running.
# ERRx return value from last command run.
# repo is $REPO_NAME.
# branch is $BRANCH_NAME.
# /foo/abc is $BRANCH_PATH.
PS1='[\[\e[34m\]$SHORT_NAME\[\e[0m\]\[\e[31m\]$__pr_depth$__pr_jobs$__pr_error\[\e[0m\]] $REPO_NAME\[\e[34m\]$__pr_branch\[\e[0m\]$BRANCH_PATH$ '

__pr_arg_count() {
  echo $#
}

PROMPT_COMMAND=__pr_prompt_command
__pr_prompt_command() {
  __pr_error="-ERR$?"
  [ $__pr_error == "-ERR0" ] && __pr_error=""

  REPO_NAME=
  BRANCH_NAME=
  BRANCH_PATH="${PWD/$HOME\//\~/}"

  local IFS=':'
  for cmd in $PROMPT_COMMANDS; do
    $cmd || break
  done

  __pr_jobs="-j$(__pr_arg_count `jobs -p`)"
  [ "$__pr_jobs" == "-j0" ] && __pr_jobs=""

  __pr_depth="-d$DEPTH"
  [ "$__pr_depth" == "-d1" ] && __pr_depth=""

  __pr_branch=""
  [ -n "$BRANCH_NAME" ] && __pr_branch="[$BRANCH_NAME]"
}
