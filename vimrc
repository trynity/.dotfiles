" Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#runtime_append_all_bundles()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

syntax on
filetype plugin indent on

set nocompatible " Don't operate in vi mode

set backup
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

set history=100

set ruler

set incsearch 

" Tab/Space Settings
set expandtab
set shiftwidth=2
set tabstop=2

set laststatus=2
set statusline=
set statusline+=%f\                          " file name
set statusline+=%h%1*%m%r%w%0*               " flags
set statusline+=%=                           " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
