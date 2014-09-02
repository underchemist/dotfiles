" underchemist's vimrc configuration file

"" COLORS
let g:molokai_original = 1

" enable syntax processing
syntax enable

"" SPACES & TABS

" backspace deletes instead of replaces
set backspace=2

" number of spaces to a tab (when opening file)
set tabstop=4
set shiftwidth=4

" number of spaces to a tab while editing (when tab is pressed)
set softtabstop=4

" tabs are spaces... <TAB> = SPACE ?
set expandtab

"" UI
" allow mouse cursor use
set mouse=a

" show line numbers
set number

" show previous command in bottom bar
set showcmd

" highlight current line
set cursorline

" load filetype-specific indent fiels
filetype plugin indent on

" redraw only when needed
set lazyredraw

" show matching [{()}]
set showmatch

"" SEARCH

" search incrementally (as characters pressed)
set incsearch

" higlight results
set hlsearch

"" SHORTCUTS

" leader is comma
let mapleader=','

" command mode trigger is jk now, not esc
inoremap jk <esc>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

"" PLUGINS

" Pathogen (plugin manager)
call pathogen#infect()
