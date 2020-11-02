set nu
set relativenumber
set nocompatible
set tabstop=4 softtabstop=4
set shiftwidth=4
set colorcolumn=80
set smartindent

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.config/nvim/plugged')  

" don't load these if using VsCode
if !exists('g:vscode')
	Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'sheerun/vim-polyglot'
	Plug 'gruvbox-community/gruvbox'
endif

" always load these plugins

call plug#end()

if !exists('g:vscode')
	let g:gruvbox_contrast_dark = 'hard'
	if exists('+termguicolors')
			let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
			let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif
	let g:gruvbox_invert_selection='0'


	let g:coc_global_extensions=[ 'coc-powershell']

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

	map <C-n> :NERDTreeToggle<CR>

	colorscheme gruvbox
	set background=dark
	set statusline=%{coc#status()}%{get(b:,'coc_current_function','')}
endif