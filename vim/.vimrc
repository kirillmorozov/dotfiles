" It is a text editor, not an IDE
" It probably has that feature built in
" Move with deliberate purpose
" The documentation is better than you imagine
" HJKL is not an important part of vim navigation
" Project drawers conflict with split windows, favor splits
" Visual clutter saps mental energy
" Use plugins sparingly
" Navigate by tags and search, not files
" If it feels hard, there is probably a better way
" You should understand every line in your vimrc
" UI "tabs" are probably not what you expect
" Don't seek mastery, seek proficiency

" Use spacebar as a leader key
let mapleader=" "

" Suppress the banner
let g:netrw_banner=0
" Open in prior window
let g:netrw_browse_split=4
" Change from left splitting to right splitting
let g:netrw_altv=1
" Tree style view in netrw
let g:netrw_liststyle=3

" Make Vim behave in a more useful way
set nocompatible

" Use a swapfile for the buffer
set noswapfile

" Automatically read file again if it was changed outside vim
set autoread

" Automatically save before :next, :make etc
set autowrite

" Set title of the window
set title

" Switch on syntax highlighting
syntax enable

filetype plugin indent on

colorscheme default
if has("termguicolors")
	set termguicolors
	colorscheme zaibatsu
endif

" Show tabs, multiple consecutive spaces, trailing spaces and breaks
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:␣,trail:·,lead:\ ,multispace:·
let &showbreak = '↪ '

" Turn on line numbers
set number
" Turn on relative line numbers
set relativenumber
" Show the line and column number of the cursor position
set ruler

" Screen columns that are highlighted
set colorcolumn=80

" Enable case insensitive searching
set ignorecase
" All searches are case insensitive unless there's a capital letter
set smartcase
" Disable all highlighted search results
set nohlsearch
" Enable incremental searching
set incsearch

" Enable text wrapping
set wrap
" Tabs=4spaces
set tabstop=4
set shiftwidth=4
" Do not expand tab
set noexpandtab

" Encoding set to UTF-8
set fileencoding = "utf-8"

" Number of items in popup menu
set pumheight=10

" Always show statusline
set laststatus=2

" Draw the signcolumn only when there is a sign to display
set signcolumn=auto

" Do smart autoindenting when starting a new line
set smartindent

" Splitting a window will put the new window below the current one
set splitbelow
" Splitting a window will put the new window right of the current one
set splitright

" If in Insert, Replace or Visual mode put a message on the last line
set showmode

" Delete comment character when joining commented lines.
set formatoptions+=j

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=8
" Minimal number of screen columns to keep to the left and to the right of the
" cursor
set sidescrolloff=8

" Command-line completion operates in an enhanced mode
set wildmenu

" Highlight Jenkinfile syntax
autocmd BufNewFile,BufRead,BufReadPost Jenkinsfile setfiletype groovy

" YAML indentation
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Key mappings
map <leader>P "+P
map <leader>p "+p
nmap <leader>/ :grep<Space>
nmap <C-H> <c-w>h
nmap <C-J> <c-w>j
nmap <C-K> <c-w>k
nmap <C-L> <c-w>l
nmap <leader>w <c-w>
nnoremap <leader>b :buffer<Space>
nnoremap <leader>f :find<Space>
nnoremap <leader>h :help<Space>
nnoremap N Nzz
nnoremap n nzz
noremap <C-S> :update<CR>
vnoremap <leader>y "+y
nmap <leader>co :copen<CR>  " Open quickfix list
nmap <leader>cc :cclose<CR>  " Close quickfix list
nmap ]q :cnext<CR>  " Next item in the quickfix list
nmap [q :cprevious<CR>  " Previous item in the quickfix list

" Use ripgrep for search if it's installed
if executable("rg")
	set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

" Format programs
if executable("gofumpt")
	autocmd FileType go setlocal formatprg=gofumpt
elseif executable("gofmt")
	autocmd FileType go setlocal formatprg=gofmt
endif

if executable("ruff")
	autocmd FileType python setlocal formatprg=ruff\ format\ -s\ -
endif

if executable("shfmt")
	autocmd FileType sh setlocal formatprg=shfmt\ -i\ 2\ -bn\ -ci\ -sr
endif

if executable("yamlfmt")
	autocmd FileType yaml setlocal formatprg=yamlfmt\ -formatter\ retain_line_breaks=true\ -in
endif

if executable("jq")
	autocmd FileType json setlocal formatprg=jq\ '.'
endif

if isdirectory(".git")
	set path+=**
endif

" If fzf is available use its built-in Vim plugin for file navigation
if executable("fzf")
	set rtp+=/opt/homebrew/opt/fzf  " for macOS and fzf installed via brew
	set rtp+=/usr/share/doc/fzf/examples  " for Debian and fzf installed via apt
	" NOTE(kirillmorozov): fzf.vim might not exist in the runtimepath so I
	" explicitly read Ex commands from the plugin and check FZF command
	" existence before adding a key map.
	runtime plugin/fzf.vim
	if exists(':FZF') == 2
		nnoremap <leader>f :FZF<CR>
	endif
endif

" Set up Git TUI client
if executable("lazygit")
	function Git()
		execute "silent !lazygit"
		redraw!
	endfunction
	command G :call Git()
	command Git :call Git()
	nmap <C-G> :Git<CR>
endif
