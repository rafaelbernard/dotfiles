# Rafael's Dotfiles

Inspired by [eevee/rc](https://github.com/eevee/rc), this repository contains my personal dotfiles for quickly reconstructing my local environment after system updates, upgrades, or physical machine replacements.

## Documentation

See `docs/` directory for full environment setups, including:
- [ThinkPad T14 Gen 3 setup with Arch Linux and Hyprland](./docs/thinkpad-14ps-arch-and-hypr.md)

## Features

### Desktop Environments & Window Managers
- **Hyprland** - Wayland compositor with custom configurations
- **i3** - X11 window manager setup (both Arch and Ubuntu variants)
- **Waybar** - Status bar configuration for Wayland
- **i3status** - Status bar for i3wm

### Shell & Terminal
- **Zsh** - Primary shell with custom configuration
- **Bash** - Secondary shell configuration  
- **Alacritty** & **Kitty** - Terminal emulator configs
- **Tmux** - Terminal multiplexer with custom theme

### Development Tools
- **Neovim** - Editor configuration (including custom Omarchy variant)
- **Git** - Global git configuration with platform-specific variants
- **Vim** - Fallback editor configuration
- **EditorConfig** - Consistent coding styles

### Applications & Utilities
- **Ranger** - File manager configuration
- **Dunst** - Notification daemon
- **Picom** - X11 compositor
- **SXHKD** - Simple X hotkey daemon
- **Walker** - Application launcher
- **PostgreSQL** - psql configuration

### System Configurations
- Network Manager DNS and WiFi settings
- X11 touchpad configuration
- ThinkPad ACPI configuration
- Custom scripts and utilities in `bin/`

## Installation

1. Clone this repository to your home directory:
   ```bash
   git clone https://github.com/rafaelbernard/dotfiles ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install
   ```

3. Platform-specific setup:
   - For Arch Linux: Additional configurations in `arch/` directory
   - For Ubuntu: Specific configs in `ubuntu/` directory

## Structure

```
.
├── .config/           # Application configurations
│   ├── hypr/         # Hyprland wayland compositor
│   ├── waybar/       # Wayland status bar
│   ├── i3/           # i3 window manager
│   ├── alacritty/    # Terminal emulator
│   ├── nvim/         # Neovim editor
│   └── ...
├── arch/             # Arch Linux specific configs
├── ubuntu/           # Ubuntu specific configs
├── bin/              # Custom scripts and utilities
├── etc/              # System configuration files
├── docs/             # Documentation and setup guides
├── install           # Main installation script
└── README.md         # This file
```

## Key Scripts

- `install` - Main installation script
- `bin/platform.sh` - Platform detection utility
- `bin/check-dns` - DNS checking utility
- `bin/toggle-wifi-systemd.sh` - WiFi management script
- `bin/link-dotfiles` - Safely link selected .config entries into ~/.config with backups, and a few custom links outside `.config`.

### Linking dotfiles

Use `bin/link-dotfiles` to create symlinks from this repo to your home directory.

The script:
- Explicitly manages a curated set of entries under `.config` (see the `entries` array inside the script).
- Uses a single link_entry function that accepts a source directory, destination directory, and entry name, so it works for both `.config` items and custom locations.
- Skips items that are already correctly linked.
- Backs up existing files/dirs/symlinks by renaming them with a `.bkp.<timestamp>` suffix before linking.
- Ensures destination parent directories exist.

Usage:
```bash
# Preview actions without making changes
DRY_RUN=1 bin/link-dotfiles

# Perform the linking
bin/link-dotfiles
```

Custom links example (already included by default):
- Source in repo: tmux/
- Destination on system: ~/tmux

Notes:
- You can extend the managed lists by editing the `entries` array inside `bin/link-dotfiles`, and add additional calls to link_entry for custom mappings (e.g., link_entry "$DOTFILES_DIR" "$HOME" "mydir").
- The script is idempotent; running it multiple times is safe.

## Development Preferences

Development tool preferences and quality/velocity tools are documented in `dev.md`.

## License

See [LICENSE](LICENSE) file for details.
