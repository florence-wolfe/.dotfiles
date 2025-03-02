DIRECTORY=~/.dotfiles
TARGET="/mnt/c/Users/flo/.dotfiles"

if [[ -d "$DIRECTORY" && ! -L "$DIRECTORY" ]]; then
    echo "Directory exists but is NOT a symlink."
elif [[ ! -e "$DIRECTORY" ]]; then
    echo "Directory does not exist. Creating symlink..."
    ln -sf "$TARGET" "$DIRECTORY"
    echo "Symlink created."
else
    echo "Directory exists and is a symlink."
fi