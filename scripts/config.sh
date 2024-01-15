setup_github_ssh() {
	ssh-keygen -t ed25519

	info "Adding ssh key to keychain"
	ssh-add --apple-use-keychain --apple-load-keychain ~/.ssh/id_ed25519
	info "Remember add ssh key to github account 'pbcopy < ~/.ssh/id_ed25519.pub'"
}

stow_dotfiles() {
	local files=(
		".aliases"
		".config/starship.toml"
		".gitconfig"
		".jq"
		".profile*"
		".vimrc"
		".zshrc"
		".zshenv"
		".zprofile"
	)
	local folders=(
		".config/fd"
		".config/git"
		".config/lf"
		".config/ripgrep"
		".config/vim"
		".config/wezterm"
		".ssh"
	)
	info "Removing existing config files"
	for f in "${files[@]}"; do
		rm -f "$HOME/$f" || true
	done

	# Create the folders to avoid symlinking folders
	for d in "${folders[@]}"; do
		rm -rf "${HOME:?}/$d" || true
		mkdir -p "$HOME/$d"
	done

	# shellcheck disable=SC2155
	local packages_to_stow=($(find stow -maxdepth 1 -type d -mindepth 1 | awk -F "/" '{print $NF}' ORS=' '))

	for package in "${packages_to_stow[@]}"; do
		info "Stowing: $package"
		stow --dir stow/ --target "$HOME" $package
	done
}
