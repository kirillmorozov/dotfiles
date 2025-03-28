local wezterm = require("wezterm")

--- Returns the appearance of the window environment.
-- If gui is not available returns 'Dark'.
local function get_appearance()
	-- NOTE(kirillmorozov): wezterm.gui is not available to the mux server, so
	-- take care to do something reasonable when this config is evaluated by the
	-- mux
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

--- Returns prefered theme for appearance.
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "rose-pine"
	else
		return "rose-pine-dawn"
	end
end

local config = {}
-- NOTE(kirillmorozov): In newer versions of wezterm, use the config_builder
-- which will help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local color_scheme_name = scheme_for_appearance(get_appearance())
local color_scheme = wezterm.color.get_builtin_schemes()[color_scheme_name]
local font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "Fira Code" })
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

config.animation_fps = 120
config.color_scheme = color_scheme_name
config.enable_scroll_bar = false
config.font = font
config.font_size = 14.0
config.max_fps = 120
config.window_padding = { bottom = 0, left = 0, right = 0, top = 0 }

bar.apply_to_config(config, {
	separator = {
		field_icon = "",
		left_icon = "❯",
		right_icon = "",
		space = 1,
	},
	modules = {
		clock = { enabled = false },
		cwd = { enabled = false },
		hostname = { enabled = false },
		leader = { enabled = false },
		pane = { enabled = false },
		spotify = { enabled = false },
		tabs = { active_tab_fg = 5, inactive_tab_fg = 8 },
		username = { enabled = false },
		workspace = { enabled = false },
	},
})

return config
