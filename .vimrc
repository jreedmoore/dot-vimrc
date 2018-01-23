" not vi
set nocompatible

" 
call plug#begin('~/.vim/plugged')

Plug 'sickill/vim-monokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-surround'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
" custom version of vim-test for scala test until I prove it and PR
Plug 'jlulian38/vim-test'


call plug#end()

" make vim useful
syntax on
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" use smart case for searches
set ignorecase
set smartcase

" configure status line / airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2 " force status line w/o splits

" underline current line
set cursorline

set showcmd " show command in bottom left

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" search from visual mode
vnoremap // y/\V<C-R>"<CR>

let mapleader="," " set leader

" vim test bindings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" NERD Tree bindings
map <C-n> :NERDTreeToggle<CR>

" indent a whole file
noremap <leader>ai mzgg=G`z 

" python debug!
noremap <leader>pdb oimport pdb; pdb.set_trace()<ESC>

" insert copyright
noremap <leader>cp ggO# -*- coding: utf-8 -*-<CR>##########################################################################<CR>#<CR># Copyright (c) 2017, Plexxi Inc. and its licensors.<CR>#<CR># All rights reserved.<CR>#<CR># Use and duplication of this software is subject to a separate license<CR># agreement between the user and Plexxi or its licensor.<CR>#<CR>##########################################################################<CR><ESC>

" use silver-search
" https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap <leader>K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" colorscheme
colorscheme monokai

set foldlevelstart=99 " start unfolded

" markdown configuration

autocmd BufNewFile,BufReadPost *.md set filetype=markdown " detect markdown, not Modula-2
let g:markdown_fenced_languages = ['haskell', 'html', 'python', 'bash=sh'] " highlight code

" strip trailing whitespace in some files
autocmd BufWritePre *.py,*.json %s/\s\+$//e
