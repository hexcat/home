" Do not configure if Vim's version is less than 8.0
if v:version < 800
    finish
endif

" Add the dein installation directory into runtimepath
if isdirectory($HOME . '/.local/share/dein/repos/github.com/Shougo/dein.vim')
  set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

  if dein#load_state('~/.local/share/dein')
    call dein#begin('~/.local/share/dein')

    " Let dein manage dein
    call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

    " Common plugins
    "call dein#add('Shougo/neosnippet.vim')
    "call dein#add('Shougo/neosnippet-snippets')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    "call dein#add('preservim/nerdtree')

    " Neovim plugins
    if has('nvim')
        call dein#add('Shougo/deoplete.nvim')
    endif

    call dein#end()
    call dein#save_state()

    " Disable mode message on the last line if vim-airline plugin is installed
    if !dein#check_install('vim-airline')
      set noshowmode
    endif
  endif
endif

" Enable file type detection and load indent and plugin files
filetype plugin indent on
" Adjust tab sizes for YAML file type
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Enable syntax highlighting
syntax on

set number         " show line numbers
set cursorline     " highlight current line
set mouse=a        " enable mouse support in all modes
set colorcolumn=80 " highlight 80th column
set shiftwidth=4   " number of spaces to use for each step of (auto)indent
set expandtab      " use spaces to insert a <Tab>
set smarttab       " use 'shiftwidth' blanks in front of a line
set tabstop=4      " number of spaces that a <Tab> in the file counts for

" Load colorscheme
if !empty(globpath(&runtimepath, 'colors/snazzy.vim'))
  colorscheme snazzy
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" vim-airline plugin options
let g:airline_powerline_fonts = 1     " enable powerline fonts
let g:airline_theme = 'base16_snazzy' " choose theme

" deoplete options
let g:deoplete#enable_at_startup = 1
