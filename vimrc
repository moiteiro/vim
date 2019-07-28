" contents of minimal .vimrc
execute pathogen#infect()
syntax on
color gruvbox
set background=dark " Setting dark mode for gruvbox theme.
let g:airline_theme='gruvbox'
filetype plugin indent on

set backspace=indent,eol,start
set expandtab
set number relativenumber
set scrolloff=10
set tabstop=2
set laststatus=2
set wildmenu

map <C-n> :NERDTreeToggle<CR>

" to insert new lines without enter in insert mode
map <Enter> o <ESC>
map <S-Enter> O<ESC>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" Save the swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
        :silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the state of your previous editing sessions
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
        " undofile - this allows you to use undo after exiting and restarting.
        " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
        " :help undo-persistence
        " This is only present in 7.3+
        if isdirectory($HOME . '/.vim/undo') == 0
               :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
        endif
        set undodir=./.vim-undo//
        set undodir+=~/.vim/undo//
        set undofile
endif

autocmd FileType ruby compiler ruby
