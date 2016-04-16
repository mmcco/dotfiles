set autoindent
set nu!
syntax on
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set nocompatible


" allows you to go to last space
" this is stupid in hindsight, so I'm removing it
" set virtualedit=onemore

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8                     " better default than latin1
  " set bomb
  set fileencoding=utf-8           " change default file encoding when writing new files
endif

" set digraph

" highlight search matches
" set hlsearch
"
" shows matching during search typing
" set incsearch
"
" search is case insensitive, unless it uses caps
set smartcase

" show incomplete commands
set showcmd

" prevents annoying lingering search highlighting
set nohlsearch

" to enable solarized
" expects TERM=screen-256color
" the order of these commands matters
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
set t_Co=256

" highlight Golang syntax - only necessary when not in package manager
"filetype off
"filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim
"iletype plugin indent on
" below command suggested in readme, but messes with solarized
" syntax on

filetype on

autocmd filetype text set textwidth=68
autocmd filetype tex set textwidth=68
autocmd filetype plaintex set textwidth=68
autocmd filetype c set textwidth=72
autocmd filetype cpp set textwidth=72
autocmd filetype markdown set textwidth=72

" avoid appending newline
autocmd filetype mail set binary

autocmd filetype text set bomb
autocmd filetype mail set bomb

autocmd filetype mail set bomb

"autocmd filetype hercules set syntax=rust
"autocmd filetype hercules set expandtab

autocmd filetype c set syntax=glib

au BufRead,BufNewFile *.cocci setfiletype diff

filetype plugin indent on

" return to line from previous exit
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" macro to fmt before closing
let @w =':%! fmt -w 78:x'

" no double space after punctuation
set nojoinspaces

let @s = ':setlocal spell spelllang=en_us'
let @d = ':%s/ a\// /:%s/ b\// /'
let @f = ':set textwidth=72k'
let @p = ':sp /tmp/t.diffggyG:qGop'
let @c = ':set colorcolumn=80'

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
    execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
    endfunction
