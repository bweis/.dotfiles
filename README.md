```
    ____        __  _____ __
   / __ \____  / /_/ __(_) /__  _____
  / / / / __ \/ __/ /_/ / / _ \/ ___/
 / /_/ / /_/ / /_/ __/ / /  __(__  )
/_____/\____/\__/_/ /_/_/\___/____/
```

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

My dotfiles to set up a dev environment in a **MacOS** machine.
Summary:
- Installs all the packages and apps I use
- [stows](https://www.gnu.org/software/stow/) all config files
- Sets all my preferred MacOS configurations

## Apps
Main apps:
- Terminal: [Wezterm](https://wezfurlong.org/wezterm/)
- Browser: Chrome, Firefox
- Video: VLC

For more details check the [apps](./scripts/apps.sh) script.

### CLI
All CLI apps are listed in the [packages](./scripts/packages.sh) script.
CLIs from other sources like `cargo` and `go` are listed in [cli](./scripts/cli.sh) script.

## Installing

> [!WARNING]
> Please review the scripts and packages that are installed and settings before running the install script

Run the `dotfiles` script:
```sh
curl -sO https://raw.githubusercontent.com/bweis/.dotfiles/main/dotfiles
```

## Reusing

In order to reuse these scripts, here a summary of files you can change/adapt to your needs:

- `scripts/packages.sh`: all the `homebrew` taps and packages to install
- `scripts/fonts.sh`: `homebrew` fonts to install
- `scripts/apps.sh`: `homebrew` casks to install
- `scripts/cli.sh`: CLI apps from different sources
- `scripts/osx.sh`: **MacOS** settings
- `scripts/config.sh`: general settings and dotfiles

## Testing Stow

Simulate `stow` links

```sh
stow -nSv vim
```

## License
Licensed under MIT, © Ben Weis 2024: https://bweis.dev
