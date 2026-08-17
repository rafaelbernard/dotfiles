---
type: Resources
belongs_to: "[[zMeta/my-posts]]"
_organized: true
---
# Arch and my Thinkpad P14s

Here I will list some of the items I used to have Arch running with the minimum I needed for my ThinkPad P14s. I have experienced a seamless experience with my old [ThinkPad Carbon x1](https://wiki.archlinux.org/title/Lenovo_ThinkPad_X1_Carbon_(Gen_2)).

I relate this to the Realtek 8852AE, an 802.11ax device used by P14s, that does not work out-the-box as the one used by x1, although faster.

I have been switching between [i3wm](https://i3wm.org/) and [hyprland](https://hypr.land/). Do not miss checking both software lists.

> **Updated 2026-08-17** for Omarchy Quattro upgrade. OS is now Omarchy (Arch-based), Hyprland config migrated from `.conf` to `.lua`, Waybar/mako/swayosd replaced by Omarchy shell (Quickshell).

## Hardware
- [Lenovo P Series](https://wiki.archlinux.org/title/Laptop/Lenovo#P_series) (no dedicated P14s page for the time being)
- [Laptop - Power Management](https://wiki.archlinux.org/title/Laptop#Power_management)
    - [Laptop/Lenovo | ThinkPad battery control](https://wiki.archlinux.org/title/Laptop/Lenovo#ThinkPad_battery_control)
    - [TLP](https://wiki.archlinux.org/title/TLP)
        - [Optimisations with TLP](https://linrunner.de/tlp/)
- Wireless / Bluetooth
    - [Realtek 8852AE driver](https://github.com/lwfinger/rtw89) (Thanks to https://github.com/lwfinger)
    - [Realtek 8852AE driver - Bluetooth](https://github.com/lwfinger/rtw89-bt) (Thanks to https://github.com/lwfinger)

# hyprland - Window Manager
These are the software while using hyperland as a [Window](https://wiki.archlinux.org/title/Hyprland) [Manager](https://wiki.archlinux.org/title/Window_manager)

| Category              | App                                                                         | Misc                                                                                                                                              |
| --------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| OS                    | [Omarchy](https://omarchy.org/) (Arch-based)                                | Quattro release. Bootloader: Limine.                                                                                                              |
| Window Manager        | [hypr.land](https://hypr.land/) 0.56.2                                      | Config in Lua: [.config/hypr/*.lua](https://github.com/rafaelbernard/dotfiles/tree/master/.config/hypr)                                           |
| Audio                 | pipewire<br>pipewire-alsa<br>pipewire-pulse<br>pipewire-jack<br>wireplumber | I had to unmask pipewire, due to legacy masking from my previous installations                                                                    |
| Battery               | tlp                                                                         | [/etc/tlp.d/](https://github.com/rafaelbernard/dotfiles/tree/master/etc/tlp.d)                                                                    |
| Clipboard             | [wl-clipboard](https://man.archlinux.org/man/wl-clipboard.1)                |                                                                                                                                                   |
| Firewall              | ufw                                                                         |                                                                                                                                                   |
| Idle / Screen Locker  | hypridle + hyprlock                                                         |                                                                                                                                                   |
| Image viewer          | [imv](https://git.sr.ht/~exec64/imv)                                        |                                                                                                                                                   |
| Launcher / Menu       | Omarchy menu (Quickshell)                                                   | Replaced walker in Quattro.                                                                                                                       |
| Night light           | hyprsunset                                                                  |                                                                                                                                                   |
| Network Manager       | NetworkManager                                                              | [etc/NetworkManager/conf.d](https://github.com/rafaelbernard/dotfiles/tree/master/etc/NetworkManager/conf.d)<br>DHCP configured to systemd-resolv |
| Network DHCP client   | systemd-resolv                                                              |                                                                                                                                                   |
| Notification daemon   | Omarchy shell (Quickshell)                                                  | Replaced mako in Quattro.                                                                                                                         |
| OSD                   | Omarchy shell (Quickshell)                                                  | Replaced swayosd in Quattro.                                                                                                                      |
| Polkit                | polkitd                                                                     |                                                                                                                                                   |
| Screenshot            | grim                                                                        |                                                                                                                                                   |
| Session Manager       | [uwsm](https://wiki.archlinux.org/title/Universal_Wayland_Session_Manager)  |                                                                                                                                                   |
| Shell                 | zsh<br>[oh-my-zsh](https://ohmyz.sh/)                                       | [.zshrc](https://github.com/rafaelbernard/dotfiles/blob/master/.zshrc)                                                                            |
| Snapshots             | timeshift<br><br>timeshift-autosnap                                         | [/etc/timeshift/timeshift.conf](./etc/timeshift/timeshift.conf)<br><br>[/etc/timeshift-autosnap.conf](./etc/timeshift-autosnap.conf)              |
| Status bar            | Omarchy shell (Quickshell)                                                  | Replaced waybar in Quattro. Config: `~/.config/omarchy/shell.json` + `shell.toml`                                                                 |
| Terminal emulator     | alacritty (default)<br>foot, kitty, ghostty (available)                     | [.config/alacritty](https://github.com/rafaelbernard/dotfiles/tree/master/.config/alacritty)                                                      |
| Terminal multiplexer  | tmux                                                                        |                                                                                                                                                   |


**ArchWiki awesome links**
- https://wiki.archlinux.org/title/Hyprland



