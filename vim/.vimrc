"                    .                    
"    ##############..... ##############   
"    ##############......##############   
"      ##########..........##########     
"      ##########........##########       
"      ##########.......##########        
"      ##########.....##########..        
"      ##########....##########.....      
"    ..##########..##########.........    
"  ....##########.#########.............  
"    ..################JJJ............    
"      ################.............      
"      ##############.JJJ.JJJJJJJJJJ      
"      ############...JJ...JJ..JJ  JJ     
"      ##########....JJ...JJ..JJ  JJ      
"      ########......JJJ..JJJ JJJ JJJ     
"      ######    .........                
"                  .....                  
"                    .      
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " VI compatible mode is disabled so that VIm things work

" Comments in Vimscript start with a `"`.


" =============================================================================
"   PLUGINS
" =============================================================================

" Set Plugin Install Directory depending on the OS
" $HOME is C:\Users\<username> in Windows and /home/<username> in Linux

" Caveats: Define variable as $<var> to make it expand in the shell. Else will
" be taken as is.

if has("win32")
    let $MYPLUGDIRECTORY = $HOME . "\\vimfiles"
elseif has("unix")
    let $MYPLUGDIRECTORY = $HOME . "/.vim"
else
    echo "Using neither Windows nor Unix!!. Unsupported config\n"
endif

if empty(glob('$MYPLUGDIRECTORY/autoload/plug.vim'))
  silent !curl -fLo $MYPLUGDIRECTORY/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$MYPLUGDIRECTORY/plugged')


" Declare the list of plugins

" Search
Plug 'junegunn/fzf'                                 " fzf is a general-purpose command-line fuzzy finder.

" Movement
Plug 'easymotion/vim-easymotion'                    " Vim motions on speed!

" Text Manipulation
Plug 'jiangmiao/auto-pairs'                         " Insert or delete brackets, parens, quotes in pair.
Plug 'tpope/vim-surround'                           " Quoting/parenthesizing made simple. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-commentary'                         " Comment stuff out.
" Plug 'tpope/vim-sensible'                         " Defaults everyone can agree on.
" Plug 'terryma/vim-multiple-cursors'               " True Sublime Text style multiple selections for Vim. (It's hanging up alot on my system).

" GUI enhancements
Plug 'scrooloose/nerdtree'                          " File Explorer
Plug 'vim-airline/vim-airline'                      " Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline-themes'               " A collection of themes for vim-airline.
Plug 'ryanoasis/vim-devicons'                       " Adds filetype glyphs (icons) to various vim plugins.

" Autocomplete

" Semantic language support
" Plug 'neoclide/coc.nvim'                          " Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode.
" Plug 'valloric/youcompleteme'                     " A code-completion engine for Vim.

" Syntactic language support
Plug 'w0rp/ale'                                     " ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in Vim asynchronously and fix files, with Language Server Protocol (LSP) support. 
Plug 'sheerun/vim-polyglot'                         " A collection of language packs for Vim.
Plug 'lervag/vimtex'                                " A modern Vim and neovim filetype plugin for LaTeX files.
Plug 'nachumk/systemverilog.vim'                    " Indent & syntax script for Verilog and SystemVerilog. 
Plug 'Shirk/vim-gas'                                " Advanced syntax highlighting for GNU As.
Plug 'mattn/emmet-vim'                              " emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
Plug 'alvan/vim-closetag'                           " Auto close (X)HTML tags

" Git GUI
Plug 'tpope/vim-fugitive'                           " A Git wrapper so awesome, it should be illegal.
Plug 'airblade/vim-gitgutter'                       " A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.

" Colorschemes
Plug 'rafi/awesome-vim-colorschemes'                " Collection of awesome color schemes for Neo/vim, merged for quick use.
Plug 'rainglow/vim'                                 " 320+ color themes for VIM.

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

" Set Encoding Scheme
set encoding=utf-8

" Set font for gvim. Console vim uses whatever font the console/termial is
" using. Vim cannot use a different font than the rest of the terminal.
set guifont=DroidSansMono\ NF:h10,IBM\ Plex\ Mono:h10,Hack:h10,Consolas:h10

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                         " Turn on syntax highlighting.
set shortmess+=I                  " Disable the default Vim startup message.
set number                        " Show line numbers.
set relativenumber                " Show relative line numbers.
set laststatus=2                  " Always show the status line at the bottom, even if you only have one window open.
set showcmd                       " Show command in bottom bar.
set cursorline                    " Highlight current line.
filetype indent on                " Load filetype-specific indent files.
filetype plugin on                " Load filetype-specific plugin files.

" Wildmenu
""""""""""""
set wildmenu                              " Visual autocomplete for command menu.
set wildmode=list:longest,full            " When you do completion in the command line via tab, First tab completes to longest common command, on the Second tab wildmenu will show up with all the completions that were listed before.
set wildignore+=*/.git/*,*/tmp/*,*.swp    " Ignore files for completion.

set showmatch                             " Highlight matching [{()}].
set mouse+=a                              " Enable mouse support.You should avoid relying on this too much, but it can sometimes be convenient.
set noerrorbells visualbell t_vb=         " Disable audible bell because it's annoying.

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4                   " Number of visual spaces per TAB.
set softtabstop=4               " Number of spaces in tab when editing.
set shiftwidth=4                " Insert 4 spaces on a tab.

" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase                  " This setting makes search case-insensitive when all characters in the string
set smartcase                   " being searched are lowercase. However, the search becomes case-sensitive if
                                " it contains any capital letters. This makes searching more convenient.
set incsearch                   " Enable searching as you type, rather than waiting till you press enter.
set hlsearch                    " Highlight matches.

" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable                  " Enable folding.

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

" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

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
nnoremap <C-c> :%y*<CR> 

" Yank into system clipboard.
vnoremap <C-c> "*y

" (Normal Mode) Paste from system clipboard. Use Ctrl-q for Visual Block Mode
nnoremap <C-v> "*p

" (Insert Mode) Paste from system clipboard.
inoremap <C-v> <C-r>+

" Switch Tabs in Gvim
nnoremap <c-Tab> :tabn<CR>

" =============================================================================
"   CUSTOM TEMPLATES
" =============================================================================

:autocmd BufNewFile cp.cpp 0r $HOME/vimfiles/templates/cp_template.cpp

" =============================================================================
"   PLUGIN CONFIG
" =============================================================================

" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NERDTree.
nnoremap <C-n> :NERDTreeToggle<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close NERDTree when you open a file
let NERDTreeQuitOnOpen = 1

" Show hidden files by default
let NERDTreeShowHidden = 1

" Make NERDTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrow = 1

" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-p> :FZF<CR>

" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigate errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"" Linting
" ALE runs all available tools by default; If you have multiple linters
" installed, it will run all of them. So either install only 1 linter or
" select a subset of them to run here in config.

"" Fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['isort', 'black']
\}

" Auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsShortcutToggle = '<Leader>tap'

" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='simple'        		" Set the vim-airline theme.
let g:airline#extensions#ale#enabled = 1	" Integrate with ALE.

" vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>gs :G<CR>              " Display Git status.
nnoremap <Leader>gj :diffget //3<CR>    " Display diff on right side.
nnoremap <Leader>gf :diffget //2<CR>    " Display diff on left side.

" vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>tgg :GitGutterToggle<CR>

" vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


