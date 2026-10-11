vim9script

if !executable('jj')
	finish
endif

def ChangedHunks()
	var root = systemlist('jj root')
	if v:shell_error
		echoerr join(root, "\n")
		return
	endif

	var diff = systemlist(
		'cd '
		.. shellescape(root[0])
		.. ' && jj --no-pager --color never diff --git --context 0'
		.. ' --config diff.git.show-path-prefix=true'
	)
	if v:shell_error
		echoerr join(diff, "\n")
		return
	endif

	var hunks: list<dict<any>> = []
	var file = ''
	for line in diff
		if line =~# '^diff --git '
			file = ''
		elseif empty(file) && line =~# '^+++ b/'
			file = root[0] .. '/' .. strpart(line, 6)
		elseif line =~# '^@@ ' && filereadable(file)
			var start = matchstr(line, '+\zs\d\+')
			hunks->add({filename: file, lnum: max([1, str2nr(start)]), text: line})
		endif
	endfor

	setqflist([], 'r', {
		title: 'jj diff hunks',
		items: hunks,
	})
	copen
enddef

nnoremap <silent> <leader>g <ScriptCmd>ChangedHunks()<CR>

def FixFile(file: string, buffer: number)
	var repository = shellescape(fnamemodify(file, ':h'))
	system('jj --ignore-working-copy --repository ' .. repository .. ' root')
	if v:shell_error
		return
	endif

	var output = systemlist(
		'jj --no-pager --color never --repository '
		.. repository
		.. ' fix --source @ -- '
		.. shellescape('file:' .. json_encode(file))
	)
	if v:shell_error
		echohl WarningMsg
		echomsg join(output, "\n")
		echohl None
		return
	endif

	execute 'checktime ' .. buffer
enddef

augroup jj_fix
	autocmd!
	autocmd BufWritePost * FixFile(expand('<afile>:p'), str2nr(expand('<abuf>')))
augroup END
