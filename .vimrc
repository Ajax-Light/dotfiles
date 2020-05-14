" Plugins will be downloaded under this specified directory
call plug#begin('$HOME/vimfiles/plugged')

" Declare the list of plugins
Plug 'scrooloose/nerdtree'
"Plug 'valloric/youcompleteme'
Plug 'neoclide/coc.nvim'
Plug 'w0rp/ale'
"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'junegunn/seoul256.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rainglow/vim'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'

" List ends here. Plugins become visible to vim after this call.
call plug#end()

syntax on		" Syntax Highlighting
colorscheme solarized8
set encoding=utf-8
set guifont=Bradley\ Hand\ ITC\ 24
" let g:airline_theme='<theme>'
autocmd VimEnter * NERDTree