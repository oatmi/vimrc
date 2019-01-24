"vundle conf {{{
set nocompatible             " be iMproved, required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdTree'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sotte/presenting.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" {{{ buf read
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
" }}}

let mapleader="-"
nnoremap <leader><tab> :NERDTreeCWD<CR>

nnoremap <tab>h <c-w>h
nnoremap <tab>j <c-w>j
nnoremap <tab>k <c-w>k
nnoremap <tab>l <c-w>l
iabbrev <expr> itime strftime("%Y/%m/%d %H:%M:%S")

set ts=4
set shiftwidth=4
set expandtab
set backspace=2
set hlsearch
set nobackup
set incsearch
"set ignorecase
set smartcase
set mouse=v
set autoindent
set encoding=utf-8
set foldmethod=marker
set scrolloff=7
set relativenumber
set nowrap
"set noexpandtab
set lazyredraw
set ttyfast

syntax on
let g:molokai_original = 1
let g:rehash256 = 1
"colorscheme darkblue
"color default
"color solarized
"color dracula
colorscheme molokai

" for vim-airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='minimalist'
