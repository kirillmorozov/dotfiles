vim9script

augroup filetypedetect
	autocmd BufRead,BufNewFile */.github/workflows/*.yml,*/.github/workflows/*.yaml setlocal filetype=githubworkflow
augroup END
