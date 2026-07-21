vim9script

if exists('g:current_compiler')
	finish
endif
g:current_compiler = 'hadolint'

if exists(':CompilerSet') != 2
	command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f:%l\ %m
CompilerSet makeprg=hadolint\ --no-color
