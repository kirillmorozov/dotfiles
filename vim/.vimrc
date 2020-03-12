" Vim-plug settings
call plug#begin('~/.vim/plugged')

" Sensible start
Plug 'tpope/vim-sensible'

" Airline
Plug 'vim-airline/vim-airline'

" Tagbar replacement
Plug 'liuchengxu/vista.vim'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" Syntax highlight
Plug 'sheerun/vim-polyglot'

" Premiere plugin for Git
Plug 'tpope/vim-fugitive'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" Markdown support
Plug 'plasticboy/vim-markdown'

" Python plugins
" Python autocomplion with Jedi
Plug 'davidhalter/jedi-vim'
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
