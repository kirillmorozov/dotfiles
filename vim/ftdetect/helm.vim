vim9script

augroup filetypedetect
	autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.yml,*/templates/*.tpl setlocal filetype=helm
augroup END
