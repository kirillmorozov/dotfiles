function! s:ResetRegisters() abort
	call setreg('t', 'TODO(agent): ')
	call setreg('f', 'FIXME(agent): ')
endfunction

call s:ResetRegisters()

command! AgentCommentsReset call <SID>ResetRegisters()

" Raw template insertion without commenting.
nnoremap <silent> <leader>ct "tp
nnoremap <silent> <leader>cf "fp
