-- Fuzzy file finder using findfunc + matchfuzzy, with wildtrigger autocomplete.
-- Ported from vim/vimrc.

-- Files cache, cleared on each cmdline entry.
local filescache = {}

--- Get a list of all files using built-in globpath.
local function glob_files()
	local raw = vim.fn.globpath(".", "**", true, true)
	local files = {}
	for _, path in ipairs(raw) do
		if vim.fn.isdirectory(path) == 0 then
			files[#files + 1] = vim.fn.fnamemodify(path, ":.")
		end
	end
	return files
end

--- Get a list of all files using fd.
local function fd_files()
	local result = vim.fn.systemlist({
		"fd",
		"--exclude",
		".git",
		"--follow",
		"--full-path",
		"--hidden",
		"--type",
		"file",
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_err_writeln(table.concat(result, "\n"))
		return {}
	end
	return result
end

local files_fetcher = vim.fn.executable("fd") == 1 and fd_files or glob_files

--- findfunc: return fuzzy-matched filenames for :find.
--- Exposed as a global for v:lua access.
function _G.FindFunc(file)
	if #filescache == 0 then
		filescache = files_fetcher()
	end
	if file == "" then
		return filescache
	end
	return vim.fn.matchfuzzy(filescache, file)
end

vim.o.findfunc = "v:lua.FindFunc"

-- Cmdline autocompletion via wildtrigger + cache clearing.
local finder_group = vim.api.nvim_create_augroup("finder", { clear = true })

vim.api.nvim_create_autocmd("CmdlineChanged", {
	group = finder_group,
	pattern = { ":", "/", "?" },
	desc = "Trigger cmdline autocompletion",
	callback = function()
		vim.fn.wildtrigger()
	end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
	group = finder_group,
	pattern = ":",
	desc = "Clear files cache on cmdline entry",
	callback = function()
		filescache = {}
	end,
})

-- <C-v> in cmdline: convert :find to :vert sfind, :buffer to :vert sbuffer.
vim.keymap.set("c", "<C-v>", function()
	if vim.fn.getcmdtype() ~= ":" then
		return "<C-v>"
	end
	local line = vim.fn.getcmdline()
	local new_line
	if line:match("^%s*find%s") then
		new_line = line:gsub("^(%s*)find%s", "%1vert sfind ", 1)
	elseif line:match("^%s*buffer%s") then
		new_line = line:gsub("^(%s*)buffer%s", "%1vert sbuffer ", 1)
	else
		return "<C-v>"
	end
	return "<C-U>" .. new_line .. "<CR>"
end, { expr = true, desc = "Open file/buffer in vertical split from cmdline" })
