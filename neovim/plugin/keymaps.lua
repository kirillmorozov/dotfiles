vim.keymap.set("n", "<C-s>", vim.cmd.update, { desc = "Save changes to a file" })
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch, { desc = "Clear highlight" })
vim.keymap.set("n", "<leader>cc", vim.cmd.cclose, { desc = "Close quickfix list" })
vim.keymap.set("n", "<leader>co", vim.cmd.copen, { desc = "Open quickfix list" })
vim.keymap.set("n", "N", "Nzz", { desc = "Center screen when searching" })
vim.keymap.set("n", "n", "nzz", { desc = "Center screen when searching" })

-- Plus register yank/paste
vim.keymap.set(
	{ "n", "o", "s", "v" },
	"<leader>y",
	'"+y',
	{ desc = "Yank text into the + register" }
)
vim.keymap.set(
	{ "n", "o", "s", "v" },
	"<leader>p",
	'"+p',
	{ desc = "Put the text from the + register after the cursor" }
)
vim.keymap.set(
	{ "n", "o", "s", "v" },
	"<leader><s-p>",
	'"+<s-p>',
	{ desc = "Put the text from the + register before the cursor" }
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

-- LSP
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename all references" })
vim.keymap.set(
	"n",
	"<leader>a",
	vim.lsp.buf.code_action,
	{ desc = "Select a code action" }
)

-- Move text up and down
vim.keymap.set("n", "<A-j>", "<Cmd>m<Space>.+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", "<Cmd>m<Space>.-2<CR>==", { desc = "Move line up" })
vim.keymap.set(
	"v",
	"<A-j>",
	"<Cmd>m<Space>'>+1<CR>gv",
	{ desc = "Move selection down" }
)
vim.keymap.set("v", "<A-k>", "<Cmd>m<Space>'<-2<CR>gv", { desc = "Move selection up" })
