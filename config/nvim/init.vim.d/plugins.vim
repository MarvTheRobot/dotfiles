" install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')  
  Plug 'szw/vim-maximizer'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
  Plug 'junegunn/fzf.vim'
  Plug 'ctrlpvim/ctrlp.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-fugitive'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "Golang
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'leafgarland/typescript-vim' " TypeScript 
  Plug 'pangloss/vim-javascript'    " JavaScript 
  Plug 'jparise/vim-graphql'        " GraphQL syntax
  Plug 'hashivim/vim-terraform'     " Terraform Syntax and LS
  
  " telescope requirements...
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'gruvbox-community/gruvbox'
call plug#end()

" Install plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
