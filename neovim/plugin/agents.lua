local function reset_registers()
	vim.fn.setreg("t", "TODO(agent): ")
	vim.fn.setreg("f", "FIXME(agent): ")
end

reset_registers()

vim.api.nvim_create_user_command(
	"AgentCommentsReset",
	reset_registers,
	{ desc = "Reset agent comment registers" }
)

-- Raw template insertion without commenting.
vim.keymap.set(
	"n",
	"<leader>ct",
	'"tp',
	{ desc = "Insert TODO(agent) template", silent = true }
)
vim.keymap.set(
	"n",
	"<leader>cf",
	'"fp',
	{ desc = "Insert FIXME(agent) template", silent = true }
)
