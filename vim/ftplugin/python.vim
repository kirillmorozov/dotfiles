setlocal autoindent
setlocal colorcolumn=80
setlocal expandtab
setlocal fileformat=unix
setlocal foldlevel=99
setlocal foldmethod=indent
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=88

if executable("ruff")
	setlocal formatprg=ruff\ format\ -s\ -
endif
