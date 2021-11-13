" install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')  
  " some LSP goodnesssss
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'RishabhRD/nvim-lsputils'
  " Required by lspunil
  Plug 'RishabhRD/popfix' 

  " Code completionn
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  " snippet support
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
 

  " telescope requirements...
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  " telescope 
  Plug 'nvim-telescope/telescope.nvim'
  " tj says so
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  " Find stuffs betterer
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
  Plug 'junegunn/fzf.vim'
  
  " make window panes biggggarrr
  Plug 'szw/vim-maximizer'

  " keep notes of shiz
  Plug 'vimwiki/vimwiki'

  "Plug 'dense-analysis/ale'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "Golang
  Plug 'omnisharp/omnisharp-vim'    " Csharpie Pen
  Plug 'leafgarland/typescript-vim' " TypeScript
  Plug 'pangloss/vim-javascript'    " JavaScript
  Plug 'jparise/vim-graphql'        " GraphQL syntax
  Plug 'hashivim/vim-terraform'     " Terraform Syntax and LS

  " make things look good
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'gruvbox-community/gruvbox'
call plug#end()

" Install plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
