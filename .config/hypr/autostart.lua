-- Extra autostart processes.
-- o.launch_on_start("my-service")

o.launch_on_start("hypridle")
o.exec_on_start("rm -rf $HOME/temp/*")
-- o.exec_on_start("setxkbmap -layout us -variant intl")
o.exec_on_start("sleep 2 && hyprctl dispatch workspace 2 && uwsm-app -- alacritty")
o.launch_on_start("slack")
o.exec_on_start("sleep 2 && hyprctl dispatch workspace 1 && uwsm-app -- firefox")

-- Rotate background every 10 minutes
hl.timer(function()
  hl.exec_cmd("$HOME/.local/bin/rotate-background")
end, { timeout = 600000, type = "repeat" })
