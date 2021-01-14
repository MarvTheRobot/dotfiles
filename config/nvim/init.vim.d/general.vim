set autoread
set history=1000
set hidden                     "Let buffers exist in background

set number
set relativenumber
set nowrap
set scrolloff=10
set backspace=indent,eol,start "Backspace (Insert)
set colorcolumn=80
set updatetime=300

highlight ColorColumn ctermbg=0 guibg=lightgrey

set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

"=================== Indentation ===================="
set tabstop=4 softtabstop=4
set shiftwidth=2
set smartindent
filetype plugin indent on

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
	silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
	set undodir=~/.config/nvim/backups
	set undofile
endif



" Open splits on the right and below
set splitbelow
set splitright
