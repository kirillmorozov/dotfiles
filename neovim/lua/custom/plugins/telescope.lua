return {
	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- If encountering errors, see telescope-fzf-native README for
			-- installation instructions
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				-- `build` is used to run some command when the plugin is
				-- installed/updated. This is only run then, not every time Neovim
				-- starts up.
				build = "make",
				-- `cond` is a condition used to determine whether this plugin should
				-- be installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things
			-- that it can fuzzy find! It's more than just a "file finder", it can
			-- search many different aspects of Neovim, your workspace, LSP, and
			-- more!

			-- The easiest way to use Telescope, is to start by doing something like:
			-- :Telescope help_tags

			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options
			-- and a corresponding preview of the help.

			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?

			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"^.git/",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set(
				"n",
				"<leader>'",
				builtin.resume,
				{ desc = "Opens the previous picker" }
			)
			vim.keymap.set(
				"n",
				"<leader>/",
				builtin.live_grep,
				{ desc = "Search for a string and get results live" }
			)
			vim.keymap.set(
				"n",
				"<leader>?",
				builtin.commands,
				{ desc = "List available commands" }
			)
			vim.keymap.set(
				"n",
				"<leader>b",
				builtin.buffers,
				{ desc = "List open buffers" }
			)
			vim.keymap.set(
				"n",
				"<leader>d",
				builtin.diagnostics,
				{ desc = "List diagnostics" }
			)
			vim.keymap.set("n", "<leader>f", function()
				builtin.find_files({ hidden = true })
			end, { desc = "Search for files" })
			vim.keymap.set(
				"n",
				"<leader>h",
				builtin.help_tags,
				{ desc = "List available help tags" }
			)
			vim.keymap.set(
				"n",
				"<leader>j",
				builtin.jumplist,
				{ desc = "List items from Vim's jumplist" }
			)
		end,
	},
}
