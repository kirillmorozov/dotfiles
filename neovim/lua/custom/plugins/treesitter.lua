return {
	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"comment",
				"diff",
				"dockerfile",
				"gitcommit",
				"gleam",
				"go",
				"json",
				"lua",
				"markdown",
				"python",
				"terraform",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["aa"] = {
							query = "@parameter.outer",
							desc = "Select around argument/parameter",
						},
						["ac"] = {
							query = "@comment.outer",
							desc = "Select around comment",
						},
						["af"] = {
							query = "@function.outer",
							desc = "Select around function",
						},
						["at"] = {
							query = "@class.outer",
							desc = "Select around type/class",
						},
						["ia"] = {
							query = "@parameter.inner",
							desc = "Select inside argument/parameter",
						},
						["ic"] = {
							query = "@comment.inner",
							desc = "Select inside comment",
						},
						["if"] = {
							query = "@function.inner",
							desc = "Select inside function",
						},
						["it"] = {
							query = "@class.inner",
							desc = "Select inside type/class",
						},
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]a"] = {
							query = "@parameter.outer",
							desc = "Next argument/parameter",
						},
						["]c"] = { query = "@comment.outer", desc = "Next comment" },
						["]f"] = { query = "@function.outer", desc = "Next function" },
						["]t"] = { query = "@class.outer", desc = "Next type/class" },
					},
					goto_previous_start = {
						["[a"] = {
							query = "@parameter.outer",
							desc = "Previous argument/parameter",
						},
						["[c"] = { query = "@comment.outer", desc = "Previous comment" },
						["[f"] = {
							query = "@function.outer",
							desc = "Previous function",
						},
						["[t"] = {
							query = "@class.outer",
							desc = "Previous type/class",
						},
					},
				},
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as
				-- Ruby) for indent rules. If you are experiencing weird indenting
				-- issues, add the language to the list of
				-- additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
