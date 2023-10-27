local wezterm = require 'wezterm'

--- This table will hold the configuration.
local config = {}

-- NOTE(kirillmorozov): In newer versions of wezterm, use the config_builder
-- which will help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

--- Returns the appearance of the window environment.
-- If gui is not available returns 'Dark'.
local function get_appearance()
  -- NOTE(kirillmorozov): wezterm.gui is not available to the mux server, so
  -- take care to do something reasonable when this config is evaluated by the
  -- mux
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

--- Returns prefered theme for appearance.
local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Rosé Pine (Gogh)'
  else
    return 'Rosé Pine Dawn (Gogh)'
  end
end

config.font_size = 14.0

config.color_scheme = scheme_for_appearance(get_appearance())

config.font = wezterm.font 'Fira Code'
config.font_size = 14.0

return config
