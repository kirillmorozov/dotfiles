-- Fuzzy Finder (files, lsp, etc)
return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.nvim", version = "*" },
		opts = { "fzf-vim" },
		keys = {
			{ "gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "Goto definition" },
			{ "gr", "<cmd>FzfLua lsp_references<CR>", desc = "Goto references" },
			{
				"gI",
				"<cmd>FzfLua lsp_implementations<CR>",
				desc = "Goto implementation",
			},
			{
				"<Leader>s",
				function()
					local fzf = require("fzf-lua")
					if vim.lsp.buf_is_attached() then
						fzf.lsp_document_symbols()
					else
						fzf.treesitter()
					end
				end,
				desc = "Document symbols",
			},
			{
				"<Leader>S",
				"<Cmd>FzfLua lsp_live_workspace_symbols<CR>",
				"Open workspace symbols",
			},
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
			{
				"<Leader>D",
				"<Cmd>FzfLua diagnostics_workspace<CR>",
				desc = "Workspace diagnostics",
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
			{
				"<Leader>q",
				"<Cmd>FzfLua quickfix<CR>",
				desc = "Quickfix list",
			},
		},
	},
}
