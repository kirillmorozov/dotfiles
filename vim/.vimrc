" Vim-plug settings
call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'

" Sensible start
Plug 'tpope/vim-sensible'

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

" To break bad habits
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
