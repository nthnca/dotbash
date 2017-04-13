# Privacy freak, make it harder for people to tell when I am writing code.

__git_commit_date() {
  local one_week=604800
  local last_date=$(date -d "$(git log -1 --pretty="%ai" 2>/dev/null)" +%s)
  local curr_date=$(date +%s)

  # May be an empty git repo, in which case $last_date is bogus.
  if git rev-parse HEAD 2>/dev/null >/dev/null; then
    # Are we within one week?
    if [ $((last_date + $one_week)) -gt $curr_date ]; then
      echo $((last_date+1))
      return
    fi
  fi

  echo $((curr_date - $((curr_date % $one_week))))
  return
}

git_commit() {
  local date=`__git_commit_date`
  GIT_AUTHOR_DATE="$date" GIT_COMMITTER_DATE="$date" git commit "$@"
}

# This seems to be a bug in git commit.
git_commit_amend() {
  git reset --soft HEAD^
  local date=`__git_commit_date`
  GIT_AUTHOR_DATE="$date" GIT_COMMITTER_DATE="$date" git commit -c ORIG_HEAD "$@"
}
