-- Fuzzy Finder (files, lsp, etc)
return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.nvim", version = "*" },
		event = "VeryLazy",
		opts = { "fzf-vim" },
		config = function(plugin, opts)
			-- calling `setup` is optional for customization
			local fzf = require(plugin.name)
			fzf.setup(opts)
			vim.keymap.set("n", "<leader>f", fzf.files, { desc = "Search for files" })
			vim.keymap.set(
				"n",
				"<leader>'",
				fzf.resume,
				{ desc = "Opens the previous picker" }
			)
			vim.keymap.set(
				"n",
				"<leader>/",
				fzf.live_grep,
				{ desc = "Search for a string and get results live" }
			)
			vim.keymap.set(
				"n",
				"<leader>?",
				fzf.commands,
				{ desc = "List available commands" }
			)
			vim.keymap.set(
				"n",
				"<leader>b",
				fzf.buffers,
				{ desc = "List open buffers" }
			)
			vim.keymap.set(
				"n",
				"<leader>h",
				fzf.helptags,
				{ desc = "List available help tags" }
			)
			vim.keymap.set(
				"n",
				"<leader>d",
				fzf.diagnostics_document,
				{ desc = "List document diagnostics" }
			)
			vim.keymap.set(
				"n",
				"<leader>j",
				fzf.jumps,
				{ desc = "List items from Vim's jumplist" }
			)
		end,
	},
}