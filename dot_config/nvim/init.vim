" lua configs
lua require('plugin')
lua require('remap')

set completeopt=noinsert,menuone,noselect
set nocompatible
set showmatch
set ignorecase
set mouse=a
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set wildmode=longest,list
set clipboard=unnamedplus
set ttyfast

" auto syntax
filetype plugin indent on
syntax on

" italics
let $t_ZH='\e[3m'
let $t_ZR='\e[23m'

