" Vim not Vi
set nocompatible

set autoread
set history=1000
set hidden                     "Let buffers exist in background

set number
set relativenumber
set backspace=indent,eol,start "Backspace (Insert)
set colorcolumn=80

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.config/nvim/plugged')  

" don't load these if using VsCode
if !exists('g:vscode')
	Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'sheerun/vim-polyglot'
	Plug 'gruvbox-community/gruvbox'

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
	Plug 'junegunn/fzf.vim'
	Plug 'ctrlpvim/ctrlp.vim'

	Plug 'szw/vim-maximizer'
endif

" always load these plugins

call plug#end()

if !exists('g:vscode')
	syntax on
	
	" Clear any mappings to space and set leader key
	nnoremap <SPACE> <Nop>
	let mapleader="\<Space>"

	" Remap paste to put the cursor in an expected place
	noremap p gp
	noremap P gP
	noremap gp p
	noremap gP P
	
	" ================ Turn Off Swap Files ==============
	set noswapfile
	set nobackup
	set nowb

	" ================ Persistent Undo ==================
	" Keep undo history across sessions, by storing in file.
	" Only works all the time.
	if has('persistent_undo')
		silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
		set undodir=~/.config/nvim/backups
		set undofile
	endif


	"=================== Indentation ===================="
	set tabstop=4 softtabstop=4
	set shiftwidth=4
	set smartindent
	" Auto indent pasted text
	"nnoremap p p=`]<C-o>
	"nnoremap P P=`]<C-o>

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

	" Open splits on the right and below
	set splitbelow
	set splitright

	
"=================== Colour / Theme ==================="
	if exists('+termguicolors')
			let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
			let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif

	let g:gruvbox_contrast_dark = 'hard'
	let g:gruvbox_invert_selection ='0'

	let g:coc_global_extensions =[ 'coc-powershell']

	" Use <c-space> to trigger completion.
	if has('nvim')
		inoremap <silent><expr> <c-space> coc#refresh()
	else
		inoremap <silent><expr> <c-@> coc#refresh()
	endif

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		elseif (coc#rpc#ready())
			call CocActionAsync('doHover')
		else
			execute '!' . &keywordprg . " " . expand('<cword>')
		endif
	endfunction
	
	
	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" NERDTree
	map <C-n> :NERDTreeToggle<CR>
	nnoremap <silent> <Leader>v :NERDTreeFind<CR>
	let g:NERDTreeWinPos = "right"
	let NERDTreeMinimalUI = 1
	let NERDTreeDirArrows = 1

	colorscheme gruvbox
	set background=dark
	set statusline=%{coc#status()}%{get(b:,'coc_current_function','')}
endif
