-- vista
vim.api.nvim_exec([[
let g:vista#renderer#enable_icon = 1
nmap <silent> <F4> :Vista!!<CR>
]], false)

-- coc
vim.api.nvim_exec([[
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier', 'coc-css', 'coc-highlight', 'coc-clangd']

" Use K to show documentation in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
highlight CocHighlightText ctermbg=Grey guibg=Grey

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
]], false)

-- git stuff
vim.api.nvim_exec([[
" git-messenger
nmap <C-m> <Plug>(git-messenger)
" signify
nmap <C-g> :SignifyToggleHighlight<cr>
" git-conflicted
" Use `gl` and `gu` rather than the default conflicted diffget mappings
let g:diffget_local_map = 'gl'
let g:diffget_upstream_map = 'gu'
set stl+=%{ConflictedVersion()}
]], false)

-- nvim-tree
vim.api.nvim_exec([[
noremap <F3> :NvimTreeToggle<CR>
]], false)

-- Telescope: CtrlP / CtrlF
vim.api.nvim_exec([[
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Rg<cr>
]], false)

-- *.avdl
vim.api.nvim_exec([[
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl
]], false)
