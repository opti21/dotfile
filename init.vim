syntax on
set history=500
set tabstop=2
set shiftwidth=2
set updatetime=50
set number
filetype plugin on
filetype indent on
set nohlsearch
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set autoread
au FocusGained,BufEnter * checktime
set scrolloff=8
set expandtab
set nu
set nowrap
set colorcolumn=80
set autochdir
let $LANG='en'
set langmenu=en
set ruler
set cmdheight=1
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldcolumn=1
set encoding=utf8
set laststatus=2
set cursorline
set shortmess+=c
set signcolumn=yes

call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mcmartelle/vim-monokai-bold'
Plug 'crusoexia/vim-monokai'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'ap/vim-css-color'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'
Plug 'andweeb/presence.nvim'
Plug 'ray-x/go.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'sbdchd/neoformat'
Plug 'onsails/lspkind-nvim'
Plug 'tzachar/cmp-tabnine', { 'do': 'powershell ./install.ps1' }
Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'
call plug#end()

set t_Co=256
set background=dark
colorscheme palenight


if (has("termguicolors"))
  set termguicolors
endif

let mapleader= " "
nmap <leader>w :w!<cr>
nmap <leader>f :Explore<CR>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>gt :FloatermNew gotest %:p:h<CR>

"lsp
autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
lua require('lsp')

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup OPTI
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

highlight Normal guibg=none

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>

" let test#go#runner = 'gotest'

