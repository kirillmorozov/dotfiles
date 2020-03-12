" Vim-plug settings
call plug#begin('~/.vim/plugged')

" Sensible start
Plug 'tpope/vim-sensible'

" Airline
Plug 'vim-airline/vim-airline'

" Tagbar replacement
Plug 'liuchengxu/vista.vim'

" Syntax highlight
Plug 'sheerun/vim-polyglot'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" Python plugins
" Text objects and motions for Python
Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }

" Robot language support
" ABB
Plug 'KnoP-01/rapid-for-vim'
" Fanuc TP
Plug 'onerobotics/vim-tp'
" Fanuc KAREL
Plug 'onerobotics/vim-karel'
" KUKA
Plug 'KnoP-01/krl-for-vim'

call plug#end()

syntax on
filetype plugin indent on

" To break bad habits
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
