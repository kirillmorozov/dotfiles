local function reset_agent_notes()
	vim.fn.setreg("t", "TODO(agent): ")
	vim.fn.setreg("f", "FIXME(agent): ")
end

reset_agent_notes()

vim.api.nvim_create_user_command("AgentNotesReset", reset_agent_notes, {
	desc = "Reset agent note registers",
})

-- Insert template above the current line, then comment with existing `gcc`.
vim.keymap.set("n", "<leader>ct", "O<C-r>t<Esc>gccA", {
	desc = "Insert TODO(agent) comment above",
	remap = true,
	silent = true,
})
vim.keymap.set("n", "<leader>cf", "O<C-r>f<Esc>gccA", {
	desc = "Insert FIXME(agent) comment above",
	remap = true,
	silent = true,
})

-- Raw template insertion without commenting.
vim.keymap.set("n", "<leader>cT", '"tp', {
	desc = "Insert TODO(agent) template",
	silent = true,
})
vim.keymap.set("n", "<leader>cF", '"fp', {
	desc = "Insert FIXME(agent) template",
	silent = true,
})
