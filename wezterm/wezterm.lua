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

local config = wezterm.config_builder()
config:set_strict_mode(true)

config.animation_fps = 120
config.color_scheme = scheme_for_appearance(get_appearance())
config.enable_scroll_bar = false
config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "Fira Code" })
config.font_size = 14.0
config.max_fps = 120
config.term = "wezterm"
config.window_padding = { bottom = 0, left = 0, right = 0, top = 0 }

-- Leader key (tmux-style prefix)
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Split panes (tmux defaults: " for horizontal, % for vertical)
	-- Each shifted character has two bindings: mods="LEADER" for macOS (SHIFT
	-- is consumed into the character) and mods="LEADER|SHIFT" for Linux (SHIFT
	-- remains as an explicit modifier).
	{
		key = '"',
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "Enter",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			-- Split right with a smaller pane for agent, keep current pane
			-- larger for editor.
			local ok, agent_pane = pcall(function()
				return pane:split({
					direction = "Right",
					size = 0.33,
				})
			end)
			if not ok then
				wezterm.log_error(
					"Failed to split pane for editor/agent layout: "
						.. tostring(agent_pane)
				)
				return
			end
			window:perform_action(wezterm.action.SendString("vimx\n"), pane)
			window:perform_action(wezterm.action.SendString("codex\n"), agent_pane)
		end),
	},

	-- Navigate panes (vim-style, popular tmux plugin: vim-tmux-navigator)
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},

	-- Resize panes
	{
		key = "H",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "H",
		mods = "LEADER|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "J",
		mods = "LEADER|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "K", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "K",
		mods = "LEADER|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "L",
		mods = "LEADER|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},

	-- Zoom pane (tmux: prefix + z)
	{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

	-- Close pane (tmux: prefix + x)
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}

wezterm.plugin
	.require("https://github.com/adriankarlen/bar.wezterm")
	.apply_to_config(config, {
		separator = {
			field_icon = "",
			left_icon = ">",
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
