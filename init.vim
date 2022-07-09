" curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

set nocompatible		" be iMproved, required
filetype off			" required
let mapleader=" "

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
call plug#end()

syntax on
colorscheme gruvbox

set number relativenumber

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
