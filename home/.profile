for f in ~/dotfiles/custom/*; do
  [ -f "$f" ] && . "$f"
done
