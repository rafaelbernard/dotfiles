-- Personal workspace and window rules migrated from windows.conf.

hl.workspace_rule({ workspace = "1", default_name = "web" })
hl.workspace_rule({ workspace = "2", default_name = "sh" })
hl.workspace_rule({ workspace = "4", default_name = "code" })

o.window("^(firefox|firefox-dev)$", { opacity = "1 1" })
o.window("^(jetbrains-idea|jetbrains-datagrip|obsidian|Slack|Postman)$", { opacity = "1 1" })

o.window("^(tmux)$", { workspace = "2" })
o.window("^(slack)$", { workspace = "3" })
o.window("^(jetbrains-idea)$", { workspace = "4" })
o.window("^(jetbrains-datagrip)$", { workspace = "5" })
o.window("^(firefox-dev)$", { workspace = "9" })

o.window("^(jetbrains-.*)$", { group = "set always" })
o.window({ workspace = "9" }, { group = "set always" })

o.window("^(org.gnome.Calculator)$", { float = true })
