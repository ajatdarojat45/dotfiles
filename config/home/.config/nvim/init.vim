call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fugitive'
Plug 'valloric/vim-indent-guides'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-surround'
Plug 'wakatime/vim-wakatime'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'raimondi/delimitmate'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
" lspconfig
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'glepnir/lspsaga.nvim'
"Plug 'connorholyday/vim-snazzy'
"Plug 'ryanoasis/vim-devicons'
"Plug 'fladson/vim-kitty'
"Plug 'vim-airline/vim-airline'
"Plug 'yggdroot/indentline'
"Plug 'gmoe/vim-espresso'
"Plug 'sainnhe/everforest'
"Plug 'joshdick/onedark.vim'
"Plug 'dracula/vim'
"Plug 'wfxr/minimap.vim'
call plug#end()

let mapleader=" "
nnoremap <SPACE> <Nop>

" require lua script
lua require('nvimtree')
lua require('override')
"lua require('coc')
lua require('lua_line')
lua require('buffer_line')
lua require('indentblankline')
lua require('mason_lspconfig')
lua require('lsp_config')
lua require('telescope_nvim')

"airline
"let g:airline_theme='base16_snazzy'

"INDENTLINE
"let g:indentLine_char = '┊'
"set list lcs=tab:\┊\ 

" vim
syntax on
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set autoindent
set cursorline
set smartindent
set expandtab
"set background=dark
"set cursorcolumn
"set foldmethod=manual
set clipboard=unnamed
colorscheme tokyonight-moon

" nvim-tree
nnoremap nn :NvimTreeFocus<CR>
nnoremap <C-u> :NvimTreeRefresh<CR>
nnoremap tt :NvimTreeToggle<CR>
"nnoremap <C-f> :NvimTreeFindFile<CR>

"prettier
nnoremap <C-s> :Prettier<CR> \| :w<CR>
nnoremap ss :Prettier<CR> \| :w<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Yank from cursor to the end of line.
nnoremap Y y$

" fzf
" Ctrl+P: cari file di direktori
"silent! nmap <C-P> :Files<CR>

" Ctrl+G: cari file di repository
"silent! namp <C-G> :GFiles<CR>

" Ctrl+F: cari file berdasarkan string/regex
"silent! nmap <C-f> :Rg!

" buffer_line
"let g:airline#extensions#tabline#enabled = 1
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-k> :bfirst<CR>
nnoremap <C-j> :blast<CR>
nnoremap <C-d> :bdelete<CR>

" minimap
let g:minimap_width = 10
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 1

" markdown preview
nnoremap mp :MarkdownPreview<CR>

