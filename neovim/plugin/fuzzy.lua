-- Fuzzy finder using findfunc + matchfuzzy, with wildtrigger autocomplete.

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
local fuzzy_group = vim.api.nvim_create_augroup("fuzzy", { clear = true })

vim.api.nvim_create_autocmd("CmdlineChanged", {
	group = fuzzy_group,
	pattern = { ":", "/", "?" },
	desc = "Trigger cmdline autocompletion",
	callback = function()
		vim.fn.wildtrigger()
	end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
	group = fuzzy_group,
	pattern = ":",
	desc = "Clear files cache on cmdline entry",
	callback = function()
		filescache = {}
	end,
})
