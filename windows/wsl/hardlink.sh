DIRECTORY=~/.dotfiles
TARGET="/mnt/c/Users/flo/.dotfiles"

if [[ -d "$DIRECTORY" && ! -L "$DIRECTORY" ]]; then
    echo "Directory exists but is NOT a hardlink."
elif [[ ! -e "$DIRECTORY" ]]; then
    echo "Directory does not exist. Creating hardlink..."
    ln "$TARGET" "$DIRECTORY"
    echo "Hardlink created."
else
    echo "Directory exists and is a hardlink."
fi