local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = "GruvboxDarkHard"

config.font = wezterm.font("0xProto Nerd Font")
config.font_size = 11

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 40

config.enable_wayland = true
config.front_end = "WebGpu"

config.keys = {
	{ key = "j", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
	{ key = "k", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
}
return config
