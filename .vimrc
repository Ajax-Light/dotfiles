" Comments in Vimscript start with a `"`.

" Plugins will be downloaded under this specified directory
call plug#begin('$HOME/vimfiles/plugged')

" Declare the list of plugins
Plug 'scrooloose/nerdtree'		" File Explorer
" Plug 'valloric/youcompleteme'		" A code-completion engine for Vim.
" Plug 'neoclide/coc.nvim'		" Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode.
Plug 'w0rp/ale'				" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in Vim asynchronously and fix files, with Language Server Protocol (LSP) support. 
Plug 'jiangmiao/auto-pairs'		" Insert or delete brackets, parens, quotes in pair.
" Plug 'tpope/vim-sensible'		" Defaults everyone can agree on.
Plug 'tpope/vim-surround'		" Quoting/parenthesizing made simple. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-commentary'		" Comment stuff out.
Plug 'tpope/vim-fugitive'		" A Git wrapper so awesome, it should be illegal.
Plug 'airblade/vim-gitgutter'		" A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'junegunn/fzf'			" fzf is a general-purpose command-line fuzzy finder.
Plug 'rafi/awesome-vim-colorschemes'	" Collection of awesome color schemes for Neo/vim, merged for quick use.
Plug 'rainglow/vim'			" 320+ color themes for VIM.
Plug 'vim-airline/vim-airline'		" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline-themes'	" A collection of themes for vim-airline.
Plug 'mattn/emmet-vim'			" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
" Plug 'terryma/vim-multiple-cursors'	" True Sublime Text style multiple selections for Vim. (It's hanging up alot on my system).
Plug 'sheerun/vim-polyglot'		" A collection of language packs for Vim.

" List ends here. Plugins become visible to vim after this call.
call plug#end()

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Set the colorscheme and Override the colors on LineNumbers and CursorLineNumber.
augroup coloroverride
	autocmd!
        autocmd ColorScheme * highlight LineNr  ctermfg=Cyan guifg=#FFA500 " Override LineNr
        autocmd ColorScheme * highlight CursorLineNr  ctermfg=Yellow guifg=#FF8C00 " Override CursorLineNr
augroup END
colorscheme molokai

" Set font for gvim. Console vim uses whatever font the console/termial is
" using. Vim cannot use a different font than the rest of the terminal.
set guifont=Consolas:h10

" Auto-Run this command everytime vim starts up.
" autocmd VimEnter * NERDTree
