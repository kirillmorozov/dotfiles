-- LSP Configuration & Plugins
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Useful status updates for LSP.
			{
				"j-hui/fidget.nvim",
				version = "*",
			},
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				version = "*",
				opts = {
					library = {
						-- See the configuration section for more details Load luvit types
						-- when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		event = { "BufNew", "BufRead" },
		version = "*",
	},
}
