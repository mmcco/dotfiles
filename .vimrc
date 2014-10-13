set autoindent
set nu!
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nocompatible
" allows you to go to last space
" this is stupid in hindsight, so I'm removing it
" set virtualedit=onemore
set encoding=utf-8
" highlight search matches
" set hlsearch
" shows matching during search typing
" set incsearch
" search is case insensitive, unless it uses caps
set smartcase
" show incomplete commands
set showcmd
set nohlsearch

" to enable solarized
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
set t_Co=256

" highlight Golang syntax
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
" below command suggested in readme, but messes with solarized
" syntax on

filetype on
