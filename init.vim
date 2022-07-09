set nocompatible		" be iMproved, required
filetype off			" required
let mapleader=" "

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
call plug#end()

filetype plugin indent on
syntax on
colorscheme gruvbox
set background=dark
set colorcolumn=80
set termguicolors
highlight ColorColumn ctermbg=236 guibg=#303030
set number relativenumber
set nowrap
set smartcase
set smartindent
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set ignorecase
set noerrorbells
set mouse=a

" Stop highlighting after searching finishes
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" ---------- NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40

nnoremap <leader>n :NERDTreeFind <bar> wincmd w<CR>
nnoremap <leader>t :NERDTreeToggle <bar> wincmd w<CR>

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

