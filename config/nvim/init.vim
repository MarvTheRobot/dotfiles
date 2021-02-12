set nocompatible
filetype off

source $HOME/.config/nvim/init.vim.d/plugins.vim
source $HOME/.config/nvim/init.vim.d/general.vim
source $HOME/.config/nvim/init.vim.d/airline.vim
source $HOME/.config/nvim/init.vim.d/theme.vim

source $HOME/.config/nvim/init.vim.d/netrw.vim
source $HOME/.config/nvim/init.vim.d/coc.vim
source $HOME/.config/nvim/init.vim.d/ctrlp.vim
source $HOME/.config/nvim/init.vim.d/omnisharp.vim
" source $HOME/.config/nvim/init.vim.d/nerdtree.vim

source $HOME/.config/nvim/init.vim.d/keyboard.vim

set statusline=%{coc#status()}%{get(b:,'coc_current_function','')}
