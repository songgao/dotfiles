require('plugins')

-- vim.api.nvim_exec(
-- [[
-- 
-- let mapleader="`"
-- 
-- "" Lightline
-- " https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
-- " https://github.com/neoclide/coc.nvim/issues/512
-- " https://github.com/liuchengxu/vista.vim#show-the-nearest-methodfunction-in-the-statusline
-- let g:lightline = {
--       \ 'active': {
--       \   'left': [ [ 'mode', 'paste' ],
--       \             [ 'readonly', 'filename', 'modified', 'CurrentFunction', 'cocstatus' ] ]
--       \ },
--       \ 'component_function': {
--       \   'filename': 'LightlineFilename',
--       \   'cocstatus': 'coc#status',
--       \   'CurrentFunction': 'CurrentFunction'
--       \ },
--       \ }
-- function! LightlineFilename()
--   let root = fnamemodify(get(b:, 'git_dir'), ':h')
--   let path = expand('%:p')
--   if path[:len(root)-1] ==# root
--     return path[len(root)+1:]
--   endif
--   return expand('%')
-- endfunction
-- function! CurrentFunction()
--     return get(b:, 'vista_nearest_method_or_function', '')
-- endfunction
-- ]], false)

vim.api.nvim_exec([[

"" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent

autocmd Filetype go setlocal ts=4 sts=4 sw=4 expandtab
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

filetype on
filetype plugin on
filetype indent on

set autowrite
set mouse=a
set undofile
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete

" performance
set lazyredraw

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
set number
" set relativenumber
set colorcolumn=80
set showmatch
set ruler
" set laststatus=2
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set termguicolors

" Visual: theme
set background=dark
colorscheme hybrid_reverse

" echodoc
set noshowmode
set cmdheight=1

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set updatetime=200

" neovim Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" key bindings: Shift-H and Shift-L for navigating tabs; Ctrl-t for new tab
nnoremap H gT
nnoremap L gt
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap <ScrollWheelUp> <C-Y>
nnoremap <ScrollWheelDown> <C-E>
nnoremap <M-k> <C-y><C-y><C-y><C-y>
nnoremap <M-j> <C-e><C-e><C-e><C-e>

]], false)
