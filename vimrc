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
Plugin 'tomasr/molokai'
" Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'lifepillar/vim-solarized8'
Plugin 'jason0x43/vim-js-indent'
Plugin 'kamykn/spelunker.vim'
Plugin 'tomlion/vim-solidity'

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

let g:go_list_type = "quickfix"


set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set backspace=2
set hlsearch
set nobackup
set smartcase
set mouse=v
set autoindent
set encoding=utf-8
set foldmethod=marker
set foldlevel=4
set scrolloff=7
set nowrap
set lazyredraw
set ttyfast
set cursorline
set diffopt=context:0
set t_Co=256
set colorcolumn=81
" set incsearch
" set relativenumber
" set number
" set list
" set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <leader><tab> :NERDTreeCWD<CR>
nnoremap <leader>e :TagbarToggle<CR>
nnoremap <leader>s :<C-u>call gitblame#echo()<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>a :Ag! <cword><cr>
nnoremap <leader>f :%! gofmt<CR>

nnoremap <tab>h <c-w>h
nnoremap <tab>j <c-w>j
nnoremap <tab>k <c-w>k
nnoremap <tab>l <c-w>l
nnoremap <tab>u gt
nnoremap <tab>i gT

iabbrev <expr> itime strftime("%Y/%m/%d %H:%M:%S")
iabbrev <expr> icmt "// Copyright(C) 2021 Baidu Inc. All Rights Reserved.<CR>
            \//<CR>
            \// Author  tao (yangtao23@baidu.com)<CR>
            \// Date   "
iabbrev <expr> idbg 'fmt.Printf("debug: %+v\n",'

" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
" highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

let g:spelunker_white_list_for_user = [
            \'haokan',
            \'logit',
            \'yangtao',
            \'ghttp',
            \'icode',
            \'baidu',
            \'hklib',
            \'unmarshal',
            \'gorm',
            \'cuid',
            \'strconv',
            \'uniswap',
            \]

" {{{ coc
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> df <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"}}}

" AIRLINE {{{
let g:airline_theme='luna'
" let g:airline_theme='minimalist'
" let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
" let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' '

" let g:airline_section_b = '%{strftime("%c")}'
" }}}

" {{{ BUF
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
" }}}

" COLORSCHEME {{{
" if use a terminal that supports italic text
" let g:vim_monokai_tasty_italic = 0
" let g:rehash256 = 1
" let g:molokai_original = 1
" let g:solarized_use16 = 1

" colorscheme nord
" colorscheme solarized8
" colorscheme molokai
colorscheme gruvbox

set background=dark
" set background=light

hi Normal guibg=NONE ctermbg=NONE


" To use the included lightline.vim theme:
" let g:lightline = {
"             \ 'colorscheme': 'monokai_tasty',
"             \ }
"
" To use the included vim-airline theme:
" let g:airline_theme='monokai_tasty'
" }}}
