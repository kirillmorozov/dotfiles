setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

if executable("yamlfmt")
	setlocal formatprg=yamlfmt\ -formatter\ retain_line_breaks=true\ -in
elseif executable("yq")
	setlocal formatprg=yq\ '.'
endif
