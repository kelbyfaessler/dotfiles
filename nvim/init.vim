"================
"Settings
"================
let mapleader = "\<space>"

set mouse=a

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

"if there's a vimrc in the project you open with nvim, it'll source it for you
"set exrc

set relativenumber
set nu

" keeps unsaved buffers open in background which allows for fast swapping back
" and forth without having to keep things in a good state i.e. saved
set hidden "keeps

" disable use of swap files (make sure to correctly save!)
set noswapfile

" case sensitive by default
set ignorecase
" will be case sensitive in searches when you use caps chars
set smartcase

" search
set incsearch
set hlsearch
"set nohlsearch

" start scrolling 8 rows from bottom of page, instead of all the way at bottom
set scrolloff=8

" adds extra column to left of line numbers that can be used for things like
" linting error icons
set signcolumn=yes

"set colorcolumn=80
set noerrorbells

set splitbelow
set splitright

set termguicolors

"================
"Remaps
"================
" Easily access init.vim
nnoremap <Leader>v :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Copy/Paste to system clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"================
"Plugins
"================
"To install plugins, run nvim and use command :PlugInstall
"To update plugins , run nvim and use command :UpdateRemotePlugins

"The following 5 lines will install vimplug automatically if not already
"installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

"colorschemes
Plug 'lunarvim/darkplus.nvim'

"infrastructure
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

"telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

"Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
"   cmp-nvim-lua is for the lua api in nvim
Plug 'hrsh7th/cmp-nvim-lua'
"   cmp-luasnip is for snippet completions
Plug 'saadparwaiz1/cmp_luasnip'

"Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

"Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"treesitter
"Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'}
"   use 0.5-compat treesitter branch with nvim 0.5 stable branch
Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'master', 'do': ':TSUpdate'}
"nvim-ts-rainbow colors matching nested brackets in different colors
Plug 'p00f/nvim-ts-rainbow'

"git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tanvirtin/vgit.nvim'

"buffers
Plug 'akinsho/bufferline.nvim'
"   bbye provides :Bdelete command alternative to :bdelete and won't close
"   windows/nvim when buffers are removed
Plug 'moll/vim-bbye'

"terminal
Plug 'akinsho/toggleterm.nvim'

"utils
"autopairs integrates with both cmp and treesitter
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

call plug#end()
"================
"Autocmds
"================
" remove whitespace autocmd because language formatters should handle this
" fun! TrimWhiteSpace()
" 	let l:save = winsaveview()
" 	keeppatterns %s/\s\+$//e
" 	call winrestview(l:save)
" endfun
"
" augroup autocmds
" 	autocmd!
" 	autocmd BufWritePre * :call TrimWhiteSpace()
"     "autocmd BufWinEnter * silent NERDTreeMirror
" augroup END
"
"vim.lsp.set_log_level("debug")

lua << EOF
require('user.colorscheme')
require('user.nvim-tree')
require('user.keymaps')
require('user.cmp')
require('user.lsp')
require('user.telescope')
require('user.treesitter')
require('user.autopairs')
require('user.comment')
require('user.gitsigns')
require('user.bufferline')
require('user.toggleterm')
require('user.vgit')

require'lspconfig'.pyright.setup{}
EOF
