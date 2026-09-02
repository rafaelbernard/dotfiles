-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

local custom_binds = {
	"SUPER + ALT + RETURN",
	"SUPER + RETURN",
	"SUPER + SHIFT + RETURN",
	"SUPER + SHIFT + F",
	"SUPER + ALT + SHIFT + F",
	"SUPER + SHIFT + B",
	"SUPER + SHIFT + N",
	"SUPER + SHIFT + T",
	"SUPER + SHIFT + D",
	"SUPER + SHIFT + O",
	"SUPER + SHIFT + SLASH",
	"SUPER + SHIFT + G",
	"SUPER + SHIFT + M",
	"SUPER + SHIFT + H",
	"SUPER + SHIFT + X",
	"SUPER + SHIFT + A",
	"SUPER + ALT + G",
	"SUPER + CTRL + K",
	"SUPER + SLASH",
	-- "SUPER + H",
	-- "SUPER + J",
	-- "SUPER + K",
	-- "SUPER + L",
	"SUPER + TAB",
	"SUPER + SHIFT + TAB",
	"SUPER + CTRL + ALT + T",
	-- "SUPER + RIGHT",
	-- "SUPER + LEFT",
	"SUPER + ALT + RIGHT",
	"SUPER + ALT + LEFT",
	"SUPER + ALT + L",
	"SUPER + ALT + H",
	"SUPER + V",
}

for _, keys in ipairs(custom_binds) do
	hl.unbind(keys)
end

o.bind("SUPER + ALT + RETURN", "Tmux", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" tmux new')
o.bind("SUPER + RETURN", "Terminal", { omarchy = "terminal" })
o.bind("SUPER + SHIFT + RETURN", "Tmux", { omarchy = "terminal-tmux" })
o.bind("SUPER + SHIFT + F", "File manager", { omarchy = "nautilus" })
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", { omarchy = "nautilus-cwd" })
o.bind("SUPER + SHIFT + B", "Browser", "uwsm-app -- firefox --new-window")
o.bind("SUPER + SHIFT + N", "Editor", { omarchy = "editor" })
o.bind("SUPER + SHIFT + T", "Activity", { tui = "btop" })
o.bind("SUPER + SHIFT + D", "Docker", { tui = "lazydocker" })
o.bind("SUPER + SHIFT + O", "Obsidian", { launch = "obsidian", focus = "^obsidian$" })
o.bind("SUPER + SHIFT + SLASH", "IntelliJ", "uwsm-app -- intellij")
o.bind("SUPER + SHIFT + G", "DataGrip", "uwsm-app -- datagrip")
o.bind("SUPER + SHIFT + M", "Thunderbird", "uwsm-app -- thunderbird")
o.bind("SUPER + SHIFT + H", "Postman", "uwsm-app -- postman")
o.bind("SUPER + SHIFT + X", "Firefox Developer", "uwsm-app -- firefox-developer")
o.bind("SUPER + ALT + G", "Google Messages", { webapp = "https://messages.google.com/web/conversations", focus = true })
o.bind("SUPER + CTRL + K", "Keybindings", "omarchy-menu-keybindings")

o.bind("SUPER + TAB", "Switch between active workspaces", hl.dsp.focus({ workspace = "previous" }))
o.bind("SUPER + ALT + RIGHT", "Next active workspace", hl.dsp.focus({ workspace = "e+1" }))
o.bind("SUPER + ALT + L", "Next active workspace", hl.dsp.focus({ workspace = "e+1" }))
o.bind("SUPER + ALT + LEFT", "Previous active workspace", hl.dsp.focus({ workspace = "e-1" }))
o.bind("SUPER + ALT + H", "Previous active workspace", hl.dsp.focus({ workspace = "e-1" }))

o.bind("SUPER + CTRL + ALT + T", "Toggle window group", hl.dsp.group.toggle())
o.bind("SUPER + CTRL + ALT + RIGHT", "Next tab", hl.dsp.group.next())
o.bind("SUPER + CTRL + ALT + LEFT", "Previous tab", hl.dsp.group.prev())
-- o.bind("SUPER + RIGHT", "Next tab", hl.dsp.group.next())
-- o.bind("SUPER + LEFT", "Previous tab", hl.dsp.group.prev())
o.bind("SUPER + CTRL + ALT + LEFT", "Move window to the group on left", hl.dsp.window.move({ into_group = "l" }))
o.bind("SUPER + CTRL + ALT + RIGHT", "Move window to the group on right", hl.dsp.window.move({ into_group = "r" }))

o.bind("SUPER + V", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
o.bind("SUPER + SHIFT + TAB", "Cycle windows", "hyprctl dispatch cyclenext force")

o.bind("SUPER + H", "Focus on left window", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + J", "Focus on below window", hl.dsp.focus({ direction = "d" }))
o.bind("SUPER + K", "Focus on above window", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + L", "Focus on right window", hl.dsp.focus({ direction = "r" }))
