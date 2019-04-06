# Make it simple to use multiple chrome profiles.
# Generate a start*chrome alias for each entry in CHROME_USERS.
# For example if CHROME_USERS is set to "fred jane" this will create 2 aliases:
# startfredchrome and startjanechrome that will us 2 different chrome profiles.

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
