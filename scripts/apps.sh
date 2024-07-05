apps=(
  android-file-transfer # https://www.android.com/filetransfer/
  clipy # Clipboard manager https://github.com/Clipy/Clipy
	discord
	firefox
	google-chrome
	rectangle # Window util
	visual-studio-code
	vlc
	wez/wezterm/wezterm # Terminal https://wezfurlong.org/wezterm
)

mas_apps=(
	1136220934 # Infuse
  1447330651 # copilot money
)

install_macos_apps() {
	info "Installing macOS apps..."
	install_brew_casks "${apps[@]}"
}

install_masApps() {
	info "Installing App Store apps..."
	for app in "${mas_apps[@]}"; do
		mas install "$app"
	done
}
