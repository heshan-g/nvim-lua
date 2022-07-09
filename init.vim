set nocompatible		" be iMproved, required
filetype off			" required
let mapleader=" "

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
set signcolumn=yes
set updatetime=0
set noerrorbells
set mouse=a

" Stop highlighting after searching finishes
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" ---------- FZF
nnoremap <C-p> :Files<Cr>
let g:fzf_layout = { 'down': '75%' }
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'

" ---------- Vim Fugitive
nnoremap <leader>d :Gvdiffsplit<CR>

" ---------- NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=50

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

