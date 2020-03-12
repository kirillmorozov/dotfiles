" Python specific settings.
set ignorecase
set smartcase
set incsearch
set hlsearch
set nospell
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal formatoptions=croql
nmap <F5> :w <CR> :!clear; python % <CR>
nmap <F6> :w <CR> :!python % 
" set foldmethod=indent
let python_highlight_all=1
