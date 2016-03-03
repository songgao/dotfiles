call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Valloric/YouCompleteMe'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'fatih/vim-go'
Plug 'amirh/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'bling/vim-bufferline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rizzatti/dash.vim'

call plug#end()

let mapleader="`"

"" Tabs
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set softtabstop=2
set autoindent

filetype on
filetype plugin on
filetype indent on

set autowrite
set mouse=a
set undofile
set omnifunc=syntaxcomplete#Complete
set backspace=indent,eol,start

set ttimeout
set ttimeoutlen=0
set matchtime=0

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Visual
syntax on
set colorcolumn=80
set showmatch
set ruler
set number
colorscheme Tomorrow-Night
set laststatus=2
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" vim-airline
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1

" YCM Configurations
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_auto_type_info=1
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Dash
:nmap <silent> <leader>d <Plug>DashSearch


" NERD Tree
noremap <F3> :NERDTreeToggle<CR>

" TagBar
nmap <silent> <F4> :TagbarToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

