TMP_FILE=$(mktemp)
if [ -n $MACOSX ]; then
  TMP_EXE="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
else
  TMP_EXE="/usr/bin/google-chrome"
fi

for user in $CHROME_USERS; do
  cat <<- EOF >> "$TMP_FILE"
    start${user}chrome ()
    {
      # Daemonize the process
      { "$TMP_EXE" --user-data-dir=$HOME/.${user}chrome >/dev/null 2>&1 & } &
    }
EOF
done

. "$TMP_FILE"

rm -f "$TMP_FILE"

unset TMP_FILE
unset TMP_EXE
