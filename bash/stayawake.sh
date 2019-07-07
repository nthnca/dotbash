# My home machine will fall asleep if it isn't kicked every so often.

# Want this to run on every new prompt.
PROMPT_COMMANDS=__stayawake:$PROMPT_COMMANDS

__stayawake () {
  if [ -z "$LINUX" ]; then
    return
  fi

  __stayawake_time="${__stayawake_time:-0}"
  # No need to kick it too often.
  local time=$(printf "%(%s)T")
  if [ $__stayawake_time -lt $((time-120)) ]; then
    __stayawake_time=$time
    touch /tmp/stayawake.shell."$USER"
  fi
}
