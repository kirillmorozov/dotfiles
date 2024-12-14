vim.keymap.set("n", "<C-s>", vim.cmd.update, { desc = "Save changes to a file" })
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch, { desc = "Clear highlight" })
vim.keymap.set("n", "<leader>cc", vim.cmd.cclose, { desc = "Close quickfix list" })
vim.keymap.set("n", "<leader>co", vim.cmd.copen, { desc = "Open quickfix list" })
vim.keymap.set("n", "N", "Nzz", { desc = "Center screen when searching" })
vim.keymap.set("n", "[q", vim.cmd.cprevious, { desc = "Previous item in a quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next item in a quickfix" })
vim.keymap.set("n", "n", "nzz", { desc = "Center screen when searching" })

-- Plus register yank/paste
vim.keymap.set(
	{ "n", "o", "s", "v" },
	"<leader>y",
	'"+y',
	{ desc = "Yank text into the plus register" }
)
vim.keymap.set(
	{ "n", "o", "s", "v" },
	"<leader>p",
	'"+p',
	{ desc = "Put the text from the plus register after the cursor" }
)
vim.keymap.set(
	{ "n", "o", "s", "v" },
	"<leader><s-p>",
	'"+<s-p>',
	{ desc = "Put the text from the plus register before the cursor" }
)

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
vim.keymap.set({ "n", "i", "v" }, "<up>", "<Nop>", { desc = "Disable arrow keys" })
vim.keymap.set({ "n", "i", "v" }, "<down>", "<Nop>", { desc = "Disable arrow keys" })
vim.keymap.set({ "n", "i", "v" }, "<left>", "<Nop>", { desc = "Disable arrow keys" })
vim.keymap.set({ "n", "i", "v" }, "<right>", "<Nop>", { desc = "Disable arrow keys" })

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
