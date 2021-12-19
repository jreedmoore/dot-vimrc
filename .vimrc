" not vi
set nocompatible

" 
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
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

" use ripgrep
" https://gist.github.com/darrylhebbes/4cc1b0995c265e8e08509b48954642c6
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_clear_cache_on_exit = 0
endif

" bind K to grep word under cursor
nnoremap <leader>K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" colorscheme
set background=light
" colorscheme solarized

set foldlevelstart=99 " start unfolded

" markdown configuration

autocmd BufNewFile,BufReadPost *.md set filetype=markdown " detect markdown, not Modula-2
let g:markdown_fenced_languages = ['haskell', 'html', 'python', 'bash=sh'] " highlight code

" strip trailing whitespace in some files
autocmd BufWritePre *.py,*.json %s/\s\+$//e

" live on edge, but keep working directory clean
set nobackup
set noswapfile
set noundofile
