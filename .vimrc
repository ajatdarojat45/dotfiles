set scrolloff=8
set number
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

let mapleader = " "

inoremap jj <Esc>
nnoremap o o<Esc>
nnoremap O O<Esc>

" quit
nnoremap <Leader>q :q!<CR>

"save
nnoremap <Leader>s :w<CR>

"open explorer
nnoremap <Leader>e :Ex<CR>

"close explorer
nnoremap <Leader>ee :Rex<CR>

" split vertical
nnoremap <Leader>pv :Vex<CR>

" split horizontal
nnoremap <Leader>ph :Hex<CR>
