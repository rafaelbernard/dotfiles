Here I will list some of the items I used to have Arch running with the minimum I needed for my ThinkPad P14s. I have experienced a seamless experience with my old [ThinkPad Carbon x1](https://wiki.archlinux.org/title/Lenovo_ThinkPad_X1_Carbon_(Gen_2)).

I relate this to the Realtek 8852AE, an 802.11ax device used by P14s, that does not work out-the-box as the one used by x1, although faster.

I have been switching between [i3wm](https://i3wm.org/) and [hyprland](https://hypr.land/). Do not miss checking both software lists.

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

| Category             | App                                      | Misc                                                                                         |
| -------------------- | ---------------------------------------- | -------------------------------------------------------------------------------------------- |
| Window Manager       | [hypr.land](https://hypr.land/)          | [.config/hypr](https://github.com/rafaelbernard/dotfiles/tree/master/.config/hypr)           |
| Notification daemon  | [mako](https://github.com/emersion/mako) |                                                                                              |
| Screen Locker        | hyprlock                                 |                                                                                              |
| Status bar           | waybar                                   | [.config/waybar](https://github.com/rafaelbernard/dotfiles/tree/master/.config/waybar)       |
| Terminal emulator    | alacritty                                | [.config/alacritty](https://github.com/rafaelbernard/dotfiles/tree/master/.config/alacritty) |
| Terminal multiplexer | tmux                                     |                                                                                              |
| Shell                | zsh<br>[oh-my-zsh](https://ohmyz.sh/)    |                                                                                              |

## Software - i3wm
- [alacritty | Terminal Emulator](https://alacritty.org/)
- [dunst | Notification Daemon](https://wiki.archlinux.org/title/Dunst)
- i3 ([.config/i3](https://github.com/rafaelbernard/dotfiles/tree/master/.config/i3))
    - i3blocks
    - [bumbleblee-status](https://github.com/tobi-wan-kenobi/bumblebee-status)
- locale (I use a US keyboard, but also want pt_BR locale)
    - [Keyboard: `sudo localectl --no-convert set-x11-keymap us intl`](https://daniel.arneam.com/blog/linux/2018-11-20-How-to-set-us-keyboard-for-brazillian-portuguese-usage-in-arch-linux/)
    - [Update 22/02/23]: `sudo localectl set-keymap --no-convert us && sudo localectl set-x11-keymap us us intl`
- [tmux | Terminal Multiplexer](https://github.com/tmux/tmux/wiki)
- [zsh](https://ohmyz.sh/)
- [Dolphin](https://wiki.archlinux.org/title/Dolphin)
- [xautolock with i3lock](https://wiki.archlinux.org/title/Session_lock#xautolock)
- [Backlight](https://wiki.archlinux.org/title/Backlight)
    - [brightnessctl](https://archlinux.org/packages/?name=brightnessctl)
    - light

**ArchWiki awesome links**
- https://wiki.archlinux.org/title/Hyprland
