" NERDTree
let g:NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && 
	\ exists("b:NERDTree") && 
	\ b:NERDTree.isTabTree()) | q | endif

" Open by default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && 
	\ !exists(“s:std_in”) && 
	\ | NERDTree | endif

" NERDTree GitStatus
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
