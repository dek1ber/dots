set nocompatible
filetype on
filetype plugin on
filetype indent on

syntax on

colorscheme desert

set encoding=utf-8
filetype plugin on
set number relativenumber

set expandtab
set ignorecase
set smartcase

autocmd BufWritePost ~/.config/dwmblocks/blocks.h !cd ~/.config/dwmblocks/; sudo make install && (killall -q dwmblocks; setsid -f dwmblocks)
