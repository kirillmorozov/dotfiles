-- Highlight, edit, and navigate code
return {
	{ "fei6409/log-highlight.nvim", event = "BufRead *.log", opts = {} },
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		config = function()
			-- Custom filetype detection for Helm and Go templates
			vim.filetype.add({
				extension = { gotmpl = "gotmpl" },
				pattern = {
					[".*/templates/.*%.tpl"] = "helm",
					[".*/templates/.*%.ya?ml"] = "helm",
					["helmfile.*%.ya?ml"] = "helm",
				},
			})

			-- Parsers to install. Compiled locally via the tree-sitter CLI.
			require("nvim-treesitter").install({
				"bash",
				"comment",
				"diff",
				"dockerfile",
				"elm",
				"gitcommit",
				"gleam",
				"go",
				"gotmpl",
				"helm",
				"json",
				"lua",
				"markdown",
				"python",
				"terraform",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
			})

			-- Filetypes to enable treesitter highlighting + indent for.
			-- Note: parser names and filetype names sometimes differ
			-- (e.g. `vimdoc` parser → `help` filetype, `bash` parser → `sh` filetype).
			-- The `comment` parser has no filetype; it is used for injections only.
			local filetypes = {
				"bash",
				"diff",
				"dockerfile",
				"elm",
				"gitcommit",
				"gleam",
				"go",
				"gotmpl",
				"helm",
				"help",
				"json",
				"lua",
				"markdown",
				"python",
				"sh",
				"terraform",
				"toml",
				"vim",
				"yaml",
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function()
					vim.treesitter.start()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		lazy = false,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				move = { set_jumps = true },
			})

			local select = require("nvim-treesitter-textobjects.select")
			local move = require("nvim-treesitter-textobjects.move")

			-- Selection keymaps: { lhs, query, desc }
			local selects = {
				{ "aa", "@parameter.outer", "Select around argument/parameter" },
				{ "ac", "@comment.outer", "Select around comment" },
				{ "af", "@function.outer", "Select around function" },
				{ "at", "@class.outer", "Select around type/class" },
				{ "ia", "@parameter.inner", "Select inside argument/parameter" },
				{ "ic", "@comment.inner", "Select inside comment" },
				{ "if", "@function.inner", "Select inside function" },
				{ "it", "@class.inner", "Select inside type/class" },
			}
			for _, s in ipairs(selects) do
				vim.keymap.set({ "x", "o" }, s[1], function()
					select.select_textobject(s[2], "textobjects")
				end, { desc = s[3] })
			end

			-- Movement keymaps: { lhs, query, direction, desc }
			local moves = {
				{ "]a", "@parameter.inner", "next", "Next argument/parameter" },
				{ "]c", "@comment.outer", "next", "Next comment" },
				{ "]f", "@function.outer", "next", "Next function" },
				{ "]t", "@class.outer", "next", "Next type/class" },
				{ "[a", "@parameter.inner", "prev", "Previous argument/parameter" },
				{ "[c", "@comment.outer", "prev", "Previous comment" },
				{ "[f", "@function.outer", "prev", "Previous function" },
				{ "[t", "@class.outer", "prev", "Previous type/class" },
			}
			for _, m in ipairs(moves) do
				local fn = m[3] == "next" and move.goto_next_start
					or move.goto_previous_start
				vim.keymap.set({ "n", "x", "o" }, m[1], function()
					fn(m[2], "textobjects")
				end, { desc = m[4] })
			end
		end,
	},
}
