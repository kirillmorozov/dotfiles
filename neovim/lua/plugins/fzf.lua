-- Fuzzy Finder (files, lsp, etc)
return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.nvim", version = "*" },
		opts = { "fzf-vim" },
		keys = {
			{
				"<leader>'",
				"<cmd>FzfLua resume<cr>",
				desc = "Opens the previous picker",
			},
			{
				"<leader>/",
				"<cmd>FzfLua live_grep<cr>",
				desc = "Search for a string and get results live",
			},
			{
				"<leader>?",
				"<cmd>FzfLua commands<cr>",
				desc = "List available commands",
			},
			{ "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "List open buffers" },
			{
				"<leader>d",
				"<cmd>FzfLua diagnostics_document<cr>",
				desc = "List document diagnostics",
			},
			{ "<leader>f", "<cmd>FzfLua files<cr>", desc = "Search for files" },
			{
				"<leader>h",
				"<cmd>FzfLua helptags<cr>",
				desc = "List available help tags",
			},
			{
				"<leader>j",
				"<cmd>FzfLua jumps<cr>",
				desc = "List items from Vim's jumplist",
			},
		},
	},
}
