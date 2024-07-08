-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the
-- search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time. Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Screen columns that are highlighted
vim.o.colorcolumn = "80"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- [[ Basic Keymaps ]]
-- Set highlight on search
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch, { desc = "Clear highlight" })

vim.keymap.set("n", "<C-s>", vim.cmd.update, { desc = "Save changes to a file" })

vim.keymap.set("n", "N", "Nzz", { desc = "Center screen when searching" })
vim.keymap.set("n", "n", "nzz", { desc = "Center screen when searching" })

vim.keymap.set("n", "<leader>co", vim.cmd.copen, { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>cc", vim.cmd.cclose, { desc = "Close quickfix list" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next item in a quickfix" })
vim.keymap.set("n", "[q", vim.cmd.cprevious, { desc = "Previous item in a quickfix" })

-- Diagnostic keymaps
vim.keymap.set(
	"n",
	"[d",
	vim.diagnostic.goto_prev,
	{ desc = "Go to previous Diagnostic message" }
)
vim.keymap.set(
	"n",
	"]d",
	vim.diagnostic.goto_next,
	{ desc = "Go to next diagnostic message" }
)
vim.keymap.set(
	"n",
	"<leader>e",
	vim.diagnostic.open_float,
	{ desc = "Show diagnostic error messages" }
)
vim.keymap.set(
	"n",
	"<leader>q",
	vim.diagnostic.setloclist,
	{ desc = "Open diagnostic quickfix list" }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit
-- easier for people to discover. Otherwise, you normally need to press
-- <C-\><C-n>, which is not what someone will guess without a bit more
-- experience.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal, insert and visual modes
for _, key in pairs({ "<up>", "<down>", "<left>", "<right>" }) do
	vim.keymap.set({ "n", "i", "v" }, key, "<Nop>", { desc = "Disable arrow keys" })
end

-- Keybinds to make split navigation easier. Use CTRL+<hjkl> to switch between
-- windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set(
	"n",
	"<leader>w",
	"<C-w>",
	{ desc = "Start window commands with <leader>w" }
)

-- [[ Basic Autocommands ]]
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({
	{ "tpope/vim-sleuth", tag = "v2.0" }, -- Detect tabstop and shiftwidth automatically

	-- "gc" to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		tag = "v0.8.0",
		opts = { opleader = { line = "<C-c>" } },
	},

	-- Adds git related signs to the gutter, as well as utilities for managing
	-- changes. See `:help gitsigns` to understand what the configuration keys do
	{
		"lewis6991/gitsigns.nvim",
		tag = "v0.7",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<C-G>", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	-- Useful plugin to show you pending keybinds.
	{
		"folke/which-key.nvim",
		tag = "v1.6.0",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()
		end,
	},

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		tag = "0.1.6",
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

	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		tag = "v0.1.7",
		dependencies = {
			-- Useful status updates for LSP.
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
			-- `neodev` configures Lua LSP for your Neovim config, runtime and
			-- plugins used for completion, annotations and signatures of Neovim apis
			{
				"folke/neodev.nvim",
				opts = {
					root_dir = vim.fn.getcwd(),
				},
			},
		},
		config = function()
			-- This function gets run when an LSP attaches to a particular buffer.
			-- That is to say, every time a new file is opened that is associated
			-- with an lsp (for example, opening `main.rs` is associated with
			-- `rust_analyzer`) this function will be executed to configure the
			-- current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup(
					"kickstart-lsp-attach",
					{ clear = true }
				),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set(
							"n",
							keys,
							func,
							{ buffer = event.buf, desc = "LSP: " .. desc }
						)
					end
					map(
						"gd",
						require("telescope.builtin").lsp_definitions,
						"Goto definition"
					)
					map(
						"gr",
						require("telescope.builtin").lsp_references,
						"Goto references"
					)
					map(
						"gI",
						require("telescope.builtin").lsp_implementations,
						"Goto implementation"
					)
					map(
						"<leader>s",
						require("telescope.builtin").lsp_document_symbols,
						"Document symbols"
					)
					map(
						"<leader>S",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"Open workspace symbols"
					)
					map("<leader>r", vim.lsp.buf.rename, "Rename all references")
					map("<leader>a", vim.lsp.buf.code_action, "Select a code action")
					map("<leader>k", vim.lsp.buf.hover, "Hover documentation")
					map("gD", vim.lsp.buf.declaration, "Goto declaration")

					-- The following two autocommands are used to highlight references of
					-- the word under your cursor when your cursor rests there for a
					-- little while. See `:help CursorHold` for information about when
					-- this is executed When you move your cursor, the highlights will be
					-- cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client.server_capabilities.documentHighlightProvider
					then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			-- LSP servers and clients are able to communicate to each other what
			-- features they support. By default, Neovim doesn't support everything
			-- that is in the LSP specification. When you add nvim-cmp, luasnip, etc.
			-- Neovim now has *more* capabilities. So, we create new capabilities
			-- with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend(
				"force",
				capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)
			local servers = {
				bashls = {},
				clangd = {},
				gopls = {},
				lua_ls = {
					on_init = function(client)
						local path = client.workspace_folders[1].name
						if
							vim.loop.fs_stat(path .. "/.luarc.json")
							or vim.loop.fs_stat(path .. "/.luarc.jsonc")
						then
							return
						end
						client.config.settings.Lua =
							vim.tbl_deep_extend("force", client.config.settings.Lua, {
								runtime = { version = "LuaJIT" },
								workspace = {
									checkThirdParty = false,
									library = { vim.env.VIMRUNTIME },
								},
							})
					end,
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
						},
					},
				},
				pylsp = {},
				terraformls = {},
			}
			for server, opts in pairs(servers) do
				require("lspconfig")[server].setup(opts)
			end
		end,
	},

	-- Autoformat
	{
		"stevearc/conform.nvim",
		tag = "v5.5.0",
		opts = {
			notify_on_error = true,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't have
				-- a well standardized coding style. You can add additional languages
				-- here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2", "-bn", "-ci", "-sr" },
				},
				stylua = {
					prepend_args = {
						"--column-width",
						88,
						"--quote-style",
						"AutoPreferDouble",
					},
				},
				yamlfmt = {
					prepend_args = {
						"-formatter",
						"include_document_start=true",
						"-formatter",
						"retain_line_breaks_single=true",
						"-formatter",
						"max_line_length=80",
						"-formatter",
						"scan_folded_as_literal=true",
						"-formatter",
						"pad_line_comments=2",
					},
				},
			},
			formatters_by_ft = {
				go = {
					{ "gofumpt", "gofmt" },
				},
				lua = { "stylua" },
				python = { "ruff_format" },
				sh = { "shfmt" },
				terraform = { "terraform_fmt" },
				yaml = { "yamlfmt" },
				json = { "jq" },
				["_"] = { "trim_whitespace" },
			},
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				tag = "v2.2.0",
				build = (function()
					-- Build Step is needed for regex support in snippets. This step is
					-- not supported in many windows environments. Remove the below
					-- condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- For an understanding of why these mappings were chosen, you will
				-- need to read `:help ins-completion`
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),
					-- Scroll the documentation window [b]ack / [f]orward
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- Accept ([y]es) the completion. This will auto-import if your LSP
					-- supports it. This will expand snippets if the LSP sent a snippet.
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<C-Space>"] = cmp.mapping.complete({}),
					-- Think of <c-l> as moving to the right of your snippet expansion.
					-- So if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					-- <c-l> will move you to the right of each of the expansion
					-- locations. <c-h> is similar, except moving you backwards.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
					-- For more advanced Luasnip keymaps (e.g. selecting choice nodes,
					-- expansion) see:
					-- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},

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

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		tag = "v1.2.0",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
			highlight = {
				pattern = [[(KEYWORDS)\s*(\([^\)]*\))?:]],
			},
			search = {
				pattern = [[\b(KEYWORDS)(?:\(\w+\))?:]],
			},
		},
	},

	-- Collection of various small independent plugins/modules
	{
		"echasnovski/mini.nvim",
		tag = "v0.12.0",
		config = function()
			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()
			-- Simple and easy statusline. You could remove this setup call if you
			-- don't like it, and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for cursor
			-- location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},

	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.2",
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
}, {})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Set tab rendering for Go files",
	pattern = "go",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.shiftwidth = 4
	end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2
