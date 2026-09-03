-- Extra autostart processes.
-- o.launch_on_start("my-service")

o.launch_on_start("hypridle")
o.exec_on_start("rm -rf $HOME/temp/*")
-- o.exec_on_start("setxkbmap -layout us -variant intl")
hl.timer(function()
  hl.dispatch(hl.dsp.focus({ workspace = "2" }))
  hl.exec_cmd(o.launch("alacritty"))
end, { timeout = 2000, type = "oneshot" })

o.launch_on_start("slack")

hl.timer(function()
  hl.dispatch(hl.dsp.focus({ workspace = "1" }))
  hl.exec_cmd(o.launch("firefox"))
end, { timeout = 5000, type = "oneshot" })

-- Rotate background every 10 minutes
hl.timer(function()
  hl.exec_cmd("$HOME/.local/bin/rotate-background")
end, { timeout = 600000, type = "repeat" })
