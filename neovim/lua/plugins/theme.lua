return {
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
		init = function()
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
