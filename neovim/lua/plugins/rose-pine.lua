return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- Make sure to load this before all the other start plugins.
		priority = 1000,
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd.colorscheme("rose-pine")
		end,
		opts = {
			styles = {
				italic = false,
				transparency = false,
			},
		},
		version = "*",
	},
}
