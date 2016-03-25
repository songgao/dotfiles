call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'eikenb/acp' " autocomplpop
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go'
Plug 'amirh/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rizzatti/dash.vim'

" Plug 'Valloric/YouCompleteMe'
" Plug 'jeetsukumaran/vim-buffergator'
" Plug 'bling/vim-bufferline'

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
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete

" key binding: Ctrl-N for moving cursor in auto-complete list
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" key bindings: Shift-H and Shift-L for navigating tabs
nnoremap H gT
nnoremap L gt

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
colorscheme hybrid_material
set laststatus=2
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" vim-airline
let g:airline_theme = 'tomorrow'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2


" YCM Configurations
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info=1
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gb <Plug>(go-build)
au FileType go nmap <Leader>gt <Plug>(go-test)

" syntastic for Go
let g:syntastic_go_checkers = ['go', 'errcheck', 'golint', 'govet']
let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['go'] }

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

" autocomplpop
let g:acp_completeoptPreview = 1
let g:acp_behaviorGoOmniLength = 0

tnoremap <Esc> <C-\><C-n>

