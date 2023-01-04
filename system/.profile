if [[ -n $SSH_LOGIN || -z $ENV ]]; then
  # Put here login initialization code
  unset SSH_LOGIN
  ENV=~/.profile
fi

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Define an array of shell names to check
shells=("$(which bash)" "$(which zsh)" "$(which fish)")

# Loop through the array of shell names
for shell in "${shells[@]}"; do
  # Check if the current shell is available, executable, and has "nix" in its output
  if which "$shell" >/dev/null && [[ -x "$(which "$shell")" ]] && which "$shell" | grep -q nix -; then
    # Exit the loop if the current shell is already assigned
    if [[ "$(which "$shell")" == "$SHELL" ]]; then break; fi
    export SHELL=$(which "$shell")
    echo "Welcome to $SHELL!"
    exec "$SHELL"
    # Exit the loop if the condition is true
    break
  fi
done
