" Clear any mappings to space and set leader key
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" Remap paste to put the cursor in an expected place
noremap p gp
noremap P gP
noremap gp p
noremap gP P

" Keep selection after indent
" don't use gvV as that doesn't work if you use V in 
" the first place
vnoremap < <gv
vnoremap > >gv

"=================== Splits ===================="
" Quick jumping between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Open new splits easily
map <Leader>wv <C-W>v
map <Leader>ws <C-W>s
map <Leader>wc <C-W>q
map <Leader>wn <C-W>n
map <Leader>wm :MaximizerToggle<CR>

" ================= CoC ======================="
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" CoC Code (Action, Fix)
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>cf <Plug>(coc-fix-current)
" Symbol renaming.
nmap <leader>cr <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ================= NERDTree =================="
map <C-l> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
