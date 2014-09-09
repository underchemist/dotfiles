" my vimrc config 2014-09-04

" Vundle & Plugin Config -----------------------------------------
set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" list plugins here
Plugin 'scrooloose/nerdtree' " easy directory and project navigation
Plugin 'kien/ctrlp.vim' " fuzzy search
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " vim status line plus add to rtp
Plugin 'tomtom/tcomment_vim' " automatic commenting
Plugin 'msanders/snipmate.vim' " useful autocomplete snippets
Plugin 'vim-scripts/TeX-9' " latex plugin

call vundle#end()
" -----------------------------------------------------------------

" UI & Colours
let g:molokai_original = 1 " color scheme
syntax enable " enable syntax processing
set mouse=a " alow mouse cursor use
set number "show line numbers
set showcmd " show previous command in bottom bar
"set highlight " underline current line
filetype plugin indent on " load filetype-specific indent files
set lazyredraw " redraw only when needed
set showmatch " show matching [{()}]

" Spaces & Tabs
set backspace=2 " restore normal backspace behaviour
set tabstop=4 " number of spaces to a tab (when opening a file)
set shiftwidth=4
set softtabstop=4 " number of spaces to a tab while editing
set expandtab " tabs are spaces ... <TAB> = SPACE?

" Search
set incsearch " search incrementally (as chars pressed)
set hlsearch " higlight results

" Shortcuts & remaps
let mapleader=',' " leader is comma
inoremap jk <esc> " command mode trigger is jk now, not <esc>
" movement keys
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
let g:ctrlp_map = '<c-p>' " ctrlp trigger

" plugin specific settings
" powerline
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'

" nerdtree
nmap <leader>n :NERDTree<cr>

" TeX-9 config
let g:tex_nine_config = { 'compiler': 'pdflatex' }
