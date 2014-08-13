"*****************************************************************************
"" NeoBundle core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let vundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

if !filereadable(vundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'Shougo/neocomplete.vim'

"" Snippets
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"
NeoBundle "honza/vim-snippets"
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'SirVer/ultisnips'

"" Color
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}


"" Custom bundles

"" Go Lang Bundle
NeoBundle "majutsushi/tagbar"
NeoBundle "fatih/vim-go"


NeoBundle "scrooloose/syntastic"
NeoBundle "majutsushi/tagbar"


NeoBundle 'vim-scripts/c.vim'


"" HTML Bundle
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'tpope/vim-haml'


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Unleash all VIM power
set nocompatible

"" Fix backspace indent
set backspace=indent,eol,start

"" allow plugins by file type
filetype on
filetype plugin on
filetype indent on

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set softtabstop=2
set autoindent

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set ttyfast

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set backspace=indent,eol,start
set showcmd
set shell=/bin/bash

"*****************************************************************************
"" Visual Settigns
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
highlight BadWhitespace ctermbg=red guibg=red
colorscheme tomorrow-night

set mousemodel=popup
set t_Co=256
set nocursorline
set guioptions=egmrt
set gfn=Monospace\ 8

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %{fugitive#statusline()}

let g:airline_theme = 'powerlineish'
let g:airline_enable_branch = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

"" NERDTree configuration
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'

"*****************************************************************************
"" Functions
"*****************************************************************************
function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=79
endfunction

function TrimWhiteSpace()
  let @*=line(".")
  %s/\s*$//e
  ''
:endfunction

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

"" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"" txt
au BufRead,BufNewFile *.txt call s:setupWrapping()

"" make/cmake
au FileType make set noexpandtab
autocmd BufNewFile,BufRead CMakeLists.txt setlocal ft=cmake

if has("gui_running")
  autocmd BufWritePre * :call TrimWhiteSpace()
endif

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>

"" Git
noremap <Leader>ga :!git add .<CR>
noremap <Leader>gc :!git commit -m '<C-R>="'"<CR>
noremap <Leader>gsh :!git push<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Tabs
nmap <Tab> gt
nmap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = ',e'
let g:ctrlp_open_new_file = 'r'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" vim-airline
let g:airline_enable_syntastic = 1

"" Remove trailing whitespace on <leader>S
nnoremap <leader>:call TrimWhiteSpace()<cr>:let @/=''<CR>

"" Copy/Paste/Cut
" noremap YY "+y<CR>
" noremap P "+gP<CR>
" noremap XX "+x<CR>

" pbcopy for OSX copy/paste
" vmap <C-x> :!pbcopy<CR>
" vmap <C-c> :w !pbcopy<CR><CR>

"" Buffer nav
nmap <C-p> :bp<CR>
nmap <C-o> :bn<CR>
noremap ,z :bp<CR>
noremap ,q :bp<CR>
noremap ,x :bn<CR>
noremap ,w :bn<CR>

"" Close buffer
noremap ,c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Open current line on GitHub
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>
"" Custom configs

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }


" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1




let g:javascript_enable_domhtmlcss = 1


"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif



set showmatch
set autowrite
set mouse=a
set undofile
set colorcolumn=80
set omnifunc=syntaxcomplete#Complete

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!

au FileType go nmap <Leader>i <Plug>(go-info)
