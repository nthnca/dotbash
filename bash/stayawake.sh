# Want this to run on every new prompt.
PROMPT_COMMANDS=__stayawake:$PROMPT_COMMANDS

__stayawake_time=0

__stayawake () {
  if [ -z "$LINUX" ]; then
    return
  fi

  local time=$(printf "%(%s)T")
  if [ $__stayawake_time -lt $((time-120)) ]; then
    __stayawake_time=$time
    $DOTBASH/bin/stayawake
  fi
}
