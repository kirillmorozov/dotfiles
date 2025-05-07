return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- Make sure to load this before all the other start plugins.
		priority = 1000,
		opts = {
			styles = {
				italic = false,
				transparency = false,
			},
		},
	},
}
