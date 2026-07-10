vim9script

augroup filetypedetect
	autocmd BufRead,BufNewFile Jenkinsfile setfiletype groovy
augroup END
