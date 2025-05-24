-- Fuzzy Finder (files, lsp, etc)
return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.nvim", version = "*" },
		keys = {
			{ "gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "Go to definition" },
			{ "gy", "<cmd>FzfLua lsp_typedefs<CR>", desc = "Go to type definition" },
			{ "grr", "<cmd>FzfLua lsp_references<CR>", desc = "Go to references" },
			{
				"gri",
				"<cmd>FzfLua lsp_implementations<CR>",
				desc = "Goto implementation",
			},
			{
				"<Leader>a",
				"<cmd>FzfLua lsp_code_actions<CR>",
				desc = "Go to references",
			},
			{
				"<Leader>s",
				function()
					local fzf = require("fzf-lua")
					if vim.lsp.buf_is_attached(0) then
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
				"<Leader>'",
				"<cmd>FzfLua resume<cr>",
				desc = "Opens the previous picker",
			},
			{
				"<Leader>/",
				"<cmd>FzfLua live_grep<cr>",
				desc = "Search for a string and get results live",
			},
			{
				"<Leader>?",
				"<cmd>FzfLua commands<cr>",
				desc = "List available commands",
			},
			{ "<Leader>b", "<cmd>FzfLua buffers<cr>", desc = "List open buffers" },
			{
				"<Leader>d",
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
		opts = { "fzf-vim" },
		version = "*",
	},
}
