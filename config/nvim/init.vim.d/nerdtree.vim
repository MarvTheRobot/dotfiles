" NERDTree
let g:NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && 
	  \ exists("b:NERDTree") && 
	  \ b:NERDTree.isTabTree()) | q | endif
