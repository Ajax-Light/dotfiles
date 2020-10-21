 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " VI compatible mode is disabled so that VIm things work

" Comments in Vimscript start with a `"`.

" Detect current OS
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif


" =============================================================================
"   PLUGINS
" =============================================================================

" Automatically Install Vim-Plug to correct Directory depending on the OS.
if g:os == "Linux"
	if empty(glob('~/.vim/autoload/plug.vim'))
  		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
elseif g:os == "Windows"
	if empty(glob('~/vimfiles/autoload/plug.vim'))
  		silent !curl -fLo ~/vimfiles/autoload/plug.vim --create-dirs
    		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif

" Plugins will be downloaded under the specified directory depending on the OS.
if g:os == "Linux"
	call plug#begin('$HOME/.vim/plugged')
elseif g:os == "Windows"
	call plug#begin('$HOME/vimfiles/plugged')
endif

" Declare the list of plugins

" Search
Plug 'junegunn/fzf'						" fzf is a general-purpose command-line fuzzy finder.

" Movement
Plug 'easymotion/vim-easymotion'		" Vim motions on speed!

" Text Manipulation
Plug 'jiangmiao/auto-pairs'				" Insert or delete brackets, parens, quotes in pair.
Plug 'tpope/vim-surround'				" Quoting/parenthesizing made simple. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-commentary'				" Comment stuff out.
" Plug 'tpope/vim-sensible'				" Defaults everyone can agree on.
" Plug 'terryma/vim-multiple-cursors'	" True Sublime Text style multiple selections for Vim. (It's hanging up alot on my system).

" GUI enhancements
Plug 'scrooloose/nerdtree'				" File Explorer
Plug 'vim-airline/vim-airline'			" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline-themes'	" A collection of themes for vim-airline.

" Autocomplete

" Semantic language support
" Plug 'neoclide/coc.nvim'				" Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode.
" Plug 'valloric/youcompleteme'			" A code-completion engine for Vim.

" Syntactic language support
Plug 'w0rp/ale'							" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in Vim asynchronously and fix files, with Language Server Protocol (LSP) support. 
Plug 'sheerun/vim-polyglot'				" A collection of language packs for Vim.
Plug 'nachumk/systemverilog.vim'		" Indent & syntax script for Verilog and SystemVerilog. 
Plug 'mattn/emmet-vim'					" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
Plug 'alvan/vim-closetag'				" Auto close (X)HTML tags

" Git GUI
Plug 'tpope/vim-fugitive'				" A Git wrapper so awesome, it should be illegal.
Plug 'airblade/vim-gitgutter'			" A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.

" Colorschemes
Plug 'rafi/awesome-vim-colorschemes'	" Collection of awesome color schemes for Neo/vim, merged for quick use.
Plug 'rainglow/vim'						" 320+ color themes for VIM.

" List ends here. Plugins become visible to vim after this call.
call plug#end()

" =============================================================================
"  EDITOR SETTINGS
" =============================================================================

" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Override the colors on LineNumbers and CursorLineNumber.
augroup coloroverride
	autocmd!
        autocmd ColorScheme * highlight LineNr  ctermfg=Cyan guifg=#FFA500          " Override LineNr
        autocmd ColorScheme * highlight CursorLineNr  ctermfg=Yellow guifg=#FF8C00  " Override CursorLineNr
augroup END

" Set the colorscheme.
colorscheme molokai

" Set font for gvim. Console vim uses whatever font the console/termial is
" using. Vim cannot use a different font than the rest of the terminal.
set guifont=Consolas:h10

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on						" Turn on syntax highlighting.
set shortmess+=I				" Disable the default Vim startup message.
set number						" Show line numbers.
set relativenumber				" Show relative line numbers.
set laststatus=2				" Always show the status line at the bottom, even if you only have one window open.
set showcmd             		" Show command in bottom bar.
set cursorline          		" Highlight current line.
filetype indent on      		" Load filetype-specific indent files.
filetype plugin on      		" Load filetype-specific plugin files.

" Wildmenu
"-----------
set wildmenu							" Visual autocomplete for command menu.
set wildmode=list:longest,full			" When you do completion in the command line via tab, First tab completes to longest common command, on the Second tab wildmenu will show up with all the completions that were listed before.
set wildignore+=*/.git/*,*/tmp/*,*.swp	" Ignore files for completion.

set showmatch							" Highlight matching [{()}].
set mouse+=a							" Enable mouse support.You should avoid relying on this too much, but it can sometimes be convenient.
set noerrorbells visualbell t_vb=		" Disable audible bell because it's annoying.

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       			" Number of visual spaces per TAB.
set softtabstop=4   			" Number of spaces in tab when editing.
set shiftwidth=4    			" Insert 4 spaces on a tab.

" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase				" This setting makes search case-insensitive when all characters in the string
set smartcase				" being searched are lowercase. However, the search becomes case-sensitive if
							" it contains any capital letters. This makes searching more convenient.
set incsearch				" Enable searching as you type, rather than waiting till you press enter.
set hlsearch            	" Highlight matches.

" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          		" Enable folding.

" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" Sensible stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" Auto-Run this command everytime vim starts up.
" autocmd VimEnter * NERDTree

" =============================================================================
"   CUSTOM MAPPINGS  (LEADER, FN, &c)
" =============================================================================

" !!Comments on the same line as mappings are interpreted as part of the mapping!!

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> 				" 'Q' in normal mode enters Ex mode. You almost never want this.
map <C-a> <Nop>				" Reassigned below
map <C-x> <Nop>				" Reassigned below

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

" Turn off search highlighting with Ctrl+h
vnoremap <C-h> :nohlsearch<CR>
nnoremap <C-h> :nohlsearch<CR>

" Leader (it's \ by default)
let mapleader = "\\" 

" Map Space to Leader in Normal Mode
nmap <Space> <Leader>

" Yank the whole document to system clipboard. 
nnoremap <C-a> :%y*<CR> 

" Jump to first non-blank character.
nnoremap <C-x> ^

" Paste from system clipboard.		
nnoremap <Leader><C-v> "*p

" Paste from system clipboard.
inoremap <C-v> <C-r>+

" Yank into system clipboard.
vnoremap <C-c> "*y

" =============================================================================
"   PLUGIN CONFIG
" =============================================================================

" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NERDTree.
nnoremap <C-n> :NERDTreeToggle<CR>

" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-p> :FZF<CR>

" Auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsShortcutToggle = '<Leader>tap'

" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='simple'		" Set the vim-airline theme.

" vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>gs :G<CR>				" Display Git status.
nnoremap <Leader>gj :diffget //3<CR>	" Display diff on right side.
nnoremap <Leader>gf :diffget //2<CR>	" Display diff on left side.

" vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>tgg :GitGutterToggle<CR>



