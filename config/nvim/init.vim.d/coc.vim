"============== Code Completion (CoC) ================="
let g:coc_global_extensions = [
	  \ 'coc-powershell',
	  \ 'coc-json',
	  \ 'coc-tsserver'
	  \]


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

