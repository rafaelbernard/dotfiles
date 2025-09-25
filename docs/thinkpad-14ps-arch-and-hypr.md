# Arch and my Thinkpad P14s

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

| Category              | App                                                                         | Misc                                                                                                                                              |
| --------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| Window Manager        | [hypr.land](https://hypr.land/)                                             | [.config/hypr](https://github.com/rafaelbernard/dotfiles/tree/master/.config/hypr)                                                                |
| Audio                 | pipewire<br>pipewire-alsa<br>pipewire-pulse<br>pipewire-jack<br>wireplumber | I had to unmask pipewire, due to legacy masking from my previous installations                                                                    |
| Battery               | tlp + tlp-rdw                                                                         | [/etc/conf.d/tpacpi](https://github.com/rafaelbernard/dotfiles/blob/master/etc/conf.d/tpacpi)                                                     |
| Clipboard             | [wl-clipboard](https://man.archlinux.org/man/wl-clipboard.1)                |                                                                                                                                                   |
| Firewall              | ufw                                                                         |                                                                                                                                                   |
| *Network backend*     | *iwd*                                                                       | *Being replaced by NetworkManager*                                                                                                                |
| Network Manager (1)   | NetworkManager                                                              | [etc/NetworkManager/conf.d](https://github.com/rafaelbernard/dotfiles/tree/master/etc/NetworkManager/conf.d)<br>DHCP configured to systemd-resolv |
| *Network Manager (2)* | *Impala*                                                                    | *Being replaced by NetworkManager<br>*                                                                                                            |
| Network DHCP client   | systemd-resolv                                                              |                                                                                                                                                   |
| Notification daemon   | [mako](https://github.com/emersion/mako)                                    |                                                                                                                                                   |
| Screen Locker         | hyprlock                                                                    |                                                                                                                                                   |
| Status bar            | waybar                                                                      | [.config/waybar](https://github.com/rafaelbernard/dotfiles/tree/master/.config/waybar)                                                            |
| Terminal emulator     | alacritty                                                                   | [.config/alacritty](https://github.com/rafaelbernard/dotfiles/tree/master/.config/alacritty)                                                      |
| Terminal multiplexer  | tmux                                                                        |                                                                                                                                                   |
| Session Manager       | [uwsm](https://wiki.archlinux.org/title/Universal_Wayland_Session_Manager)  |                                                                                                                                                   |
| Shell                 | zsh<br>[oh-my-zsh](https://ohmyz.sh/)                                       | [.zshrc](https://github.com/rafaelbernard/dotfiles/blob/master/.zshrc)                                                                            |

**ArchWiki awesome links**
- https://wiki.archlinux.org/title/Hyprland

