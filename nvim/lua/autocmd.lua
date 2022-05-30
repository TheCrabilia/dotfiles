-- nvim does not have autocmd native interface yet, so we can use vimscript syntax
local exec = vim.api.nvim_exec

exec([[
" Change directory where the file is stored
autocmd BufEnter * silent! lcd %:p:h

" Save file on buffer change
autocmd BufLeave * silent! w

" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Format golang files on save
autocmd BufWritePre *.go :silent! lua require("go.format").goimport()
]], false)
