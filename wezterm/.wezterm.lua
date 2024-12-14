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
		return "Rosé Pine (Gogh)"
	else
		return "Rosé Pine Dawn (Gogh)"
	end
end

local config = {}
-- NOTE(kirillmorozov): In newer versions of wezterm, use the config_builder
-- which will help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.enable_scroll_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = scheme_for_appearance(get_appearance())

config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "Fira Code" })
config.font_size = 14.0

config.animation_fps = 120
config.max_fps = 120

return config
