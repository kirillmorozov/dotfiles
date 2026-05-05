function! s:ResetAgentNotes() abort
	call setreg('t', 'TODO(agent): ')
	call setreg('f', 'FIXME(agent): ')
endfunction

call s:ResetAgentNotes()

command! AgentNotesReset call <SID>ResetAgentNotes()

" Insert template above the current line, then comment with existing `gcc`.
nmap <silent> <leader>ct O<C-r>t<Esc>gccA
nmap <silent> <leader>cf O<C-r>f<Esc>gccA

" Raw template insertion without commenting.
nnoremap <silent> <leader>cT "tp
nnoremap <silent> <leader>cF "fp
