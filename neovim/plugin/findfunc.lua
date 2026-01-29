local files_cache = {}

local function glob_files()
  local files = vim.fn.globpath('.', '**', true, true)
  files = vim.tbl_filter(function(path)
    return vim.fn.isdirectory(path) == 0
  end, files)
  files = vim.tbl_map(function(path)
    return vim.fn.fnamemodify(path, ':.')
  end, files)
  return files
end

local function fd_files()
  local find_command = table.concat({
    'fd',
    '--exclude .git',
    '--follow',
    '--full-path',
    '--hidden',
    '--type file',
  }, ' ')
  local result = vim.fn.systemlist(find_command)
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln(table.concat(result, '\n'))
    return {}
  end
  return result
end

local files_fetcher = glob_files
if vim.fn.executable('fd') == 1 then
  files_fetcher = fd_files
end

local function findfunc(file)
  if #files_cache == 0 then
    files_cache = files_fetcher()
  end
  if file == '' then
    return files_cache
  end
  return vim.fn.matchfuzzy(files_cache, file)
end

if vim.fn.exists('+findfunc') == 1 then
  vim.o.findfunc = findfunc
end

vim.api.nvim_create_augroup('findfunc_cache', { clear = true })
vim.api.nvim_create_autocmd('CmdlineEnter', {
  group = 'findfunc_cache',
  pattern = ':',
  callback = function()
    files_cache = {}
  end,
})
