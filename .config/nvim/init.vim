if &compatible
    set nocompatible
endif

set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
    call dein#begin('~/.local/share/dein')

    " Let dein manage dein
    call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here like this:
    "call dein#add('Shougo/neosnippet.vim')
    "call dein#add('Shougo/neosnippet-snippets')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('preservim/nerdtree')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

set number
set cursorline

set tabstop=4 shiftwidth=4 expandtab softtabstop=0
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

colorscheme snazzy

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_snazzy'

let g:deoplete#enable_at_startup = 1
