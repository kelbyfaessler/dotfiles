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

" NERDTree
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <leader>n :NERDTreeToggle<CR>
"nnoremap <C-n> :NERDTreeFind<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

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

"telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'

"Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"================
"Autocmds
"================
fun! TrimWhiteSpace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

augroup autocmds
	autocmd!
	autocmd BufWritePre * :call TrimWhiteSpace()
    "autocmd BufWinEnter * silent NERDTreeMirror
augroup END

"vim.lsp.set_log_level("debug")

lua << EOF
require('user.colorscheme')
require('user.nvim-tree')
require('user.keymaps')
require('user.cmp')

require'lspconfig'.pyright.setup{}
EOF
