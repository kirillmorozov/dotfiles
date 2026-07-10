vim9script

def ResetRegisters()
	setreg('t', 'TODO(agent): ')
	setreg('f', 'FIXME(agent): ')
enddef

ResetRegisters()

command! AgentCommentsReset ResetRegisters()

# Raw template insertion without commenting.
nnoremap <silent> <leader>ct "tp
nnoremap <silent> <leader>cf "fp
