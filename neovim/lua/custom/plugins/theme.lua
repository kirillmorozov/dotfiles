return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- Make sure to load this before all the other start plugins.
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("rose-pine")
			vim.cmd.hi("Comment gui=none")
		end,
	},
}
