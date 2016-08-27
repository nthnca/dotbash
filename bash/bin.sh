for dir in "$DOTBASH"/../*/bin; do
  if [ -d $dir ]; then
    PATH="$PATH:`cd "${dir}";pwd`"
  fi
done
