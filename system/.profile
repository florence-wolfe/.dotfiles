if [ -n "$SSH_LOGIN" ] || [ -z "$ENV" ]; then
	# Put here login initialization code
	unset SSH_LOGIN
	ENV=~/.profile
fi

export PATH="$HOME/.local/bin:$PATH"
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi                                                 # added by Nix installer
if [ -e "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh" ]; then . "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"; fi # source the home manager session

# Define an array of shell names to check
shells=("$(command -v zsh)" "$(command -v fish)" "$(command -v bash)")

# Loop through the array of shell names
for shell in "${shells[@]}"; do
	if [ -n "$KEEP_SHELL" ]; then
		break
	fi
	# Check if the current shell is available, executable, and has "nix" in its output
	if command -v "$shell" >/dev/null && [ -x "$(command -v "$shell")" ] && realpath "$(command -v "$shell")" | grep -q "nix"; then
		# If the current shell is already assigned
		if [ "$(command -v "$shell")" = "$SHELL" ]; then
			case "$shell" in
			*zsh)
				[ -f "$HOME/.zshrc" ] && source "$HOME/.zshrc"
				;;
			*bash)
				[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
				;;
			*fish)
				[ -f "$HOME/.config/fish/config.fish" ] && source "$HOME/.config/fish/config.fish"
				;;
			esac
			break
		fi
		export SHELL=$(command -v "$shell")
		echo "Welcome to $SHELL!"
		exec "$SHELL"
		# Exit the loop if the condition is true
		break
	fi
done
