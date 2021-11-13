" Clear any mappings to space and set leader key
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

nnoremap <silent> <Leader>y "+y
vnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>p "+gP
vnoremap <silent> <Leader>p "+gP
nnoremap <silent> <Leader>P "+gp
vnoremap <silent> <Leader>P "+gp
vnoremap p "_dP
" Keep selection after indent
" don't use gvV as that doesn't work if you use V in 
" the first place
vnoremap < <gv
vnoremap > >gv

"=================== File Browsing ============="
nnoremap <C-f> :Lexplore!<CR>

" ================= Telescope ================="
nnoremap <leader>te <cmd>Telescope buffers<cr>
nnoremap <leader>tc <cmd>Telescope find_commits<cr>
nnoremap <leader>tb <cmd>Telescope file_browser<cr>
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>ca <cmd>Telescope lsp_code_actions<CR>
nnoremap <leader>gd <cmd>Telescope lsp_definitions<CR>
nnoremap <leader>gr <cmd>Telescope lsp_references<CR>
nnoremap <leader>gi <cmd>Telescope lsp_implementations<CR>
" Stuffs I can't find a Telescope version of
nnoremap <silent> <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>

" Other stuffs
nnoremap <silent> <leader>fd <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

" Window Management
map <Leader>wv <C-W>v
map <Leader>ws <C-W>s
map <Leader>wc <C-W>q
map <Leader>wn <C-W>n
map <Leader>wm :MaximizerToggle<CR>
