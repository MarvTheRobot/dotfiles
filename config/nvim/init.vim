source $HOME/.config/nvim/init.vim.d/plugins.vim
source $HOME/.config/nvim/init.vim.d/general.vim
source $HOME/.config/nvim/init.vim.d/airline.vim
source $HOME/.config/nvim/init.vim.d/theme.vim
source $HOME/.config/nvim/init.vim.d/netrw.vim
" source $HOME/.config/nvim/init.vim.d/coc.vim
source $HOME/.config/nvim/init.vim.d/omnisharp.vim
source $HOME/.config/nvim/init.vim.d/keyboard.vim

" set statusline=%{coc#status()}%{get(b:,'coc_current_function','')}

autocmd BufNewFile,BufRead *.bicep set filetype=bicep

lua << EOF
  require('marv.lsp-setup')
  require('marv.completions')
EOF
