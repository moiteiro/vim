" contents of minimal .vimrc
execute pathogen#infect()
syntax on
color dracula
filetype plugin indent on

set backspace=indent,eol,start
set expandtab
set number relativenumber
set scrolloff=10
set tabstop=2
set laststatus=2

map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



autocmd FileType ruby compiler ruby
