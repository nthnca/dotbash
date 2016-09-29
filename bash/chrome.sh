# Make it simple to use multiple chrome profiles.
# Generate a start*chrome alias for each entry in CHROME_USERS.

__startchrome () {
  # Daemonize the process
  if [ -n "$MACOSX" ]; then
    local EXE="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
  else
    local EXE="/usr/bin/google-chrome"
  fi

  ( "$EXE" --user-data-dir=$HOME/.${1}chrome >/dev/null 2>&1 & ) &
}

for user in $CHROME_USERS; do
  # Daemonize the process.
  eval "alias start${user}chrome='__startchrome ${user}'"
done
