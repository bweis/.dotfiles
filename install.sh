#!/usr/bin/env zsh

set -o errexit
set -o nounset
set -o pipefail

. scripts/utils.sh
. scripts/brew.sh
. scripts/apps.sh
. scripts/cli.sh
. scripts/config.sh
. scripts/osx.sh
. scripts/fonts.sh
. scripts/packages.sh
. scripts/oh-my-zsh.sh

cleanup() {
	err "Last command failed"
	info "Finishing..."
	exit
}

confirm() {
	response=""
	vared -p 'Are you sure? [y/N]' -c response
	case "$response" in
	[yY][eE][sS] | [yY]) true ;;
	*) false ;;	
	esac
}

main() {
	info "Installing ..."

	info "################################################################################"
	info "Homebrew Packages"
	info "################################################################################"
	confirm && install_packages

	post_install_packages
	success "Finished installing Homebrew packages"

	info "################################################################################"
	info "Homebrew Fonts"
	info "################################################################################"
	confirm && install_fonts
	success "Finished installing fonts"

	info "################################################################################"
	info "Oh-my-zsh"
	info "################################################################################"
	confirm && install_oh_my_zsh
	success "Finished installing Oh-my-zsh"

	info "################################################################################"
	info "MacOS Apps via Brew"
	info "################################################################################"
	confirm && install_macos_apps
	
	info "################################################################################"
	info "MacOS Apps via MAS"
	info "################################################################################"
	confirm && install_masApps
	success "Finished installing macOS apps"

	info "################################################################################"
	info "PiP modules"
	info "################################################################################"
	confirm && install_python_packages
	success "Finished installing python packages"

	info "################################################################################"
	info "Rust tools"
	info "################################################################################"
	confirm && install_rust_tools
	success "Finished installing Rust tools"

	info "################################################################################"
	info "Golang tools"
	info "################################################################################"
	confirm && install_go_tools
	success "Finished installing Golang tools"

	info "################################################################################"
	info "Configuration"
	info "################################################################################"

	info "################################################################################"
	info "OSX Configuration"
	info "################################################################################"
	confirm && setup_osx
	success "Finished configuring MacOS defaults. NOTE: A restart is needed"

	stow_dotfiles
	success "Finished stowing dotfiles"

	info "################################################################################"
	info "Crating development folders"
	info "################################################################################"
	confirm && mkdir -p ~/Development

	info "################################################################################"
	info "SSH Key"
	info "################################################################################"
	confirm && setup_github_ssh
	success "Finished setting up SSH Key"

	success "Done"

	info "System needs to restart. Restart?"

	select yn in "y" "n"; do
		case $yn in
		y)
			sudo shutdown -r now
			break
			;;
		n) exit ;;
		esac
	done
}

trap cleanup SIGINT SIGTERM ERR EXIT

main
