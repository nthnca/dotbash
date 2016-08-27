# Repository commands.

__repo_status () {
  ls | xargs -P 10 -I{} git -C {} fetch

  local COLOR='\033[0;34m'
  local NO_COLOR='\033[0m'

  for dir in *; do
    if [ -d "$dir" ]; then
      echo -e "${COLOR}${dir}...\033[0m"
      cd "$dir"
      git status -sb
      echo
      git log origin/master..
      echo
      cd ..
    fi
  done
}
alias rpull='( cd $DOTBASH/..; ls | xargs -P 10 -I{} git -C {} pull; );'
alias rpush='( cd $DOTBASH/..; ls | xargs -I{} git -C {} push; );'
alias rst='( cd $DOTBASH/..; __repo_status; );'
