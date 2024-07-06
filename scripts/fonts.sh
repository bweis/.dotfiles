fonts=(
	font-fira-code
	font-fira-mono-nerd-font
)

install_fonts() {
	info "Installing fonts..."
	install_brew_casks "${fonts[@]}"
}
