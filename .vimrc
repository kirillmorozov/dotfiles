" Plugins
call plug#begin('~/.vim/plugged')

" Sensible start
Plug 'tpope/vim-sensible'

" Vim HardTime
Plug 'takac/vim-hardtime'

" Easy motions
Plug 'easymotion/vim-easymotion'

" Airline
Plug 'vim-airline/vim-airline'

" Hybrid numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Tagbar replacement
Plug 'liuchengxu/vista.vim'

" Premiere plugin for Git
Plug 'tpope/vim-fugitive'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" Syntax highlight
Plug 'sheerun/vim-polyglot'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" Markdown support
Plug 'plasticboy/vim-markdown'

" Python plugins
"" Python autocomplion with Jedi
Plug 'davidhalter/jedi-vim'
"" Text objects and motions for Python
Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }

" Robot language support
"" ABB
Plug 'KnoP-01/rapid-for-vim'
"" Fanuc TP
Plug 'onerobotics/vim-tp'
"" Fanuc KAREL
Plug 'onerobotics/vim-karel'
"" KUKA
Plug 'KnoP-01/krl-for-vim'

call plug#end()

set number relativenumber
syntax on
filetype plugin indent on

" Switch on hardtime mode to break bad habbits
let g:hardtime_default_on = 1
