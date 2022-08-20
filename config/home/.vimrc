call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yggdroot/indentline'
Plug 'gmoe/vim-espresso'
Plug 'jamshedvesuna/vim-markdown-preview'
Plug 'tpope/vim-fugitive'
Plug 'valloric/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/everforest'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'prettier/vim-prettier'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-surround'
Plug 'wakatime/vim-wakatime'
Plug 'wfxr/minimap.vim'
"Plug 'tmhedberg/simpylfold'
Plug 'terryma/vim-multiple-cursors'
Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" snazzy
let g:SnazzyTransparent = 1

"airline
let g:airline_theme='base16_snazzy'

"INDENTLINE
let g:indentLine_char = '┊'
set list lcs=tab:\┊\ 

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
colorscheme snazzy

" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-r> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"prettier
nnoremap <C-s> :Prettier<CR> \| :w<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Yank from cursor to the end of line.
nnoremap Y y$

" fzf
" Ctrl+P: cari file di direktori
silent! nmap <C-P> :Files<CR>

" Ctrl+G: cari file di repository
silent! namp <C-G> :GFiles<CR>

" Ctrl+F: cari file berdasarkan string/regex
silent! nmap <C-f> :Rg!


" VIM-ESPRESSO
"set t_Co=256
"set background=dark

" vim-markdown-preview
let vim_markdown_preview_github=1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-k> :bfirst<CR>
nnoremap <C-j> :blast<CR>
nnoremap <C-d> :bdelete<CR>

" minimap
let g:minimap_width = 10
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 1

