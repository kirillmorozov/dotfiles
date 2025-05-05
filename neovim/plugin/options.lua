vim.cmd.colorscheme("rose-pine")

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

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
vim.opt.listchars = {
	extends = "›",
	lead = " ",
	multispace = "·",
	nbsp = "␣",
	precedes = "‹",
	tab = "» ",
	trail = "·",
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = "nosplit"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Screen columns that are highlighted
vim.o.colorcolumn = "80"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- Set highlight on search
vim.opt.hlsearch = true

-- Enable inlay hints
vim.lsp.inlay_hint.enable()

-- Enable virtual lines
vim.diagnostic.config({
	virtual_lines = { current_line = false },
})

vim.lsp.enable({
	"gleam",
	"gopls",
	"ruff",
	"terraform-ls",
})
