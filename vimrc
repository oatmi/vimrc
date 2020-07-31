" Before you started, Install Vundle!
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" And now, you are ready to VIM!

" {{{ VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'zivyangll/git-blame.vim'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'fatih/vim-go'
" Plugin 'valloric/youcompleteme'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
"
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
"
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
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

" COMMON CONF {{{
syntax on
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set backspace=2
set hlsearch
set nobackup
set incsearch
set smartcase
set mouse=v
set autoindent
set encoding=utf-8
set foldmethod=marker
set foldlevel=4
set scrolloff=7
"set relativenumber
set number
set nowrap
set lazyredraw
set ttyfast
set cursorline
set diffopt=context:0
set t_Co=256

let mapleader="-"
nnoremap <leader><tab> :NERDTreeCWD<CR>
nnoremap <leader>e :TagbarToggle<CR>
nnoremap <leader>s :<C-u>call gitblame#echo()<CR>
nnoremap <leader>c I//<C-c>

nnoremap <tab>h <c-w>h
nnoremap <tab>j <c-w>j
nnoremap <tab>k <c-w>k
nnoremap <tab>l <c-w>l
iabbrev <expr> itime strftime("%Y/%m/%d %H:%M:%S")
" }}}

" AIRLINE {{{
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" }}}

" {{{ BUF
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
" }}}

" COLORSCHEME {{{
" if use a terminal that supports italic text
let g:vim_monokai_tasty_italic = 0
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme vim-monokai-tasty

" To use the included lightline.vim theme:
let g:lightline = {
            \ 'colorscheme': 'monokai_tasty',
            \ }

" To use the included vim-airline theme:
let g:airline_theme='monokai_tasty'
" }}}
