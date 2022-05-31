let mapleader = " "         " Space is my leader
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

" my sets {{{
set nocompatible
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME
" syntax on
set encoding=UTF-8
scriptencoding UTF-8
" set mouse=a
set exrc
" set guicursor=
" set cursorline
set number relativenumber
set nohlsearch
" set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set spelllang=en_us
set foldmethod=marker
set foldmarker={{{,}}}
set smartindent
set nowrap " Displays in single 
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode  " not needed after statusline
set completeopt=menuone,noinsert,noselect
set colorcolumn=90
set signcolumn=yes
" }}}

" my mappings {{{
imap jk <Esc>
nnoremap <space>bn :bn<cr>
nnoremap <space>bp :bp<cr>
nnoremap <space>bd :bd<cr>
nnoremap <space>w :w<cr>
nnoremap <space>qq :q<cr>
nnoremap <space>so :so %<cr>
nnoremap <space>nf :Neoformat<cr>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" }}}
