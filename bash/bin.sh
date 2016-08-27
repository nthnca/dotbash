# Add each repository that has a bin directory to the PATH.
for dir in "${DOTBASH}"/../*/bin; do
  [ -d "$dir" ] || continue
  PATH="$PATH:$(cd "${dir}";pwd)"
done
