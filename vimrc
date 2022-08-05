" Before you started, Install Vundle!
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" And now, you are ready to VIM!

" {{{ VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'zivyangll/git-blame.vim'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'ycm-core/YouCompleteMe'
Plugin 'ryanoasis/vim-devicons'

" Plugin 'bsdelf/bufferhint'

" https://github.com/sheerun/vim-polyglot
Plugin 'sheerun/vim-polyglot'

Plugin 'tomasr/molokai'
" Plugin 'lifepillar/vim-solarized8'
" Plugin 'kamykn/spelunker.vim'

" https://github.com/sainnhe/everforest
Plugin 'sainnhe/everforest'

" https://github.com/sainnhe/gruvbox-material
Plugin 'sainnhe/gruvbox-material'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" COMMON CONF {{{
syntax on

set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set backspace=2
set hlsearch
set nobackup
set smartcase
set mouse=v
set autoindent
set encoding=utf-8
set foldmethod=indent
set foldlevel=5
set scrolloff=7
set nowrap
set lazyredraw
set ttyfast
set cursorline
set diffopt=context:0
set t_Co=256
set sidescroll=1
set linebreak
set tags=tags

" set colorcolumn=101
" set relativenumber
" set incsearch
" set number
" set list

nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <leader><tab> :NERDTreeCWD<CR>
nnoremap <leader>e :TagbarToggle<CR>
nnoremap <leader>s :<C-u>call gitblame#echo()<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>a :Ag! <cword><cr>

autocmd FileType go nmap <Leader>d <Plug>(go-def)
autocmd FileType go nmap <Leader>f <Plug>(go-referrers)

nnoremap <tab>h <c-w>h
nnoremap <tab>j <c-w>j
nnoremap <tab>k <c-w>k
nnoremap <tab>l <c-w>l
nnoremap <tab>u gt
nnoremap <tab>i gT

nnoremap - :call bufferhint#Popup()<CR>
nnoremap \ :call bufferhint#LoadPrevious()<CR>

iabbrev <expr> itime strftime("%Y/%m/%d %H:%M:%S")
iabbrev <expr> icmt "// Copyright(C) 2021 Baidu Inc. All Rights Reserved.<CR>
            \//<CR>
            \// Author  tao (yangtao23@baidu.com)<CR>
            \// Date   "
iabbrev <expr> idbg 'fmt.Printf("debug: %+v\n",'

" Override highlight setting.

" locationlist
let g:ycm_always_populate_location_list = 1
" }}}

" {{{ VIM-GO
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_deadline = "5s"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
nmap <silent> df <Plug>(-definition)
" }}}

" AIRLINE {{{
" let g:airline_theme='luna'
" let g:airline_theme='minimalist'
" let g:airline_theme='solarized'
" let g:airline_theme='everforest'
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.colnr = ' '

" let g:airline_section_b = '%{strftime("%c")}'
" }}}

" {{{ BUF
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
" }}}

" COLORSCHEME everforest {{{
" Important!
if has('termguicolors')
    set termguicolors
endif
" For dark version.
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
" For better performance
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material
" }}}
