" Maintainer:	Jean-Pierre Chauvel <jchauvel@gmail.com>
" Last change:	2014 Jan 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
"
" ============================ Vim Basic Settings ============================
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use xterm as the terminal simulator under GNU Screen
"if match($TERM, "screen") != -1
"    set term=xterm
"endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" set backup and swap options
set nobackup                    " back up current file, delete afterwards
set writebackup                 " back up current file, delete afterwards
set backupdir=~/.vim/tmp,/tmp,. " backups directory
set dir=~/.vim/tmp,/tmp,.       " swap directory

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=100		" keep 100 lines of command line history
set matchpairs+=<:>	" match to be used witrh %

" ruler bar options
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set laststatus=2    " always show the statusline

 
"set encoding=utf-8  " necessary to show unicode glyphs

" search options
set incsearch		" do incremental searching
set ignorecase

" tab space configuration
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set nowrap

" Mouse support even on terminals (in all modes)
set mouse=a
" Allow mouse events even on GNU screen sessions
set ttymouse=xterm2

" Tell Vim the terminal supports 256 colors
set t_Co=256

" Accerelate things up when working on a gnome-terminal
set scrolljump=5

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" GUI options
if has("gui_running")
    set guifont=Monospace\ 12
    let g:winManagerWindowLayout = "FileExplorer,TagsExplorer"
    let g:TagBase_CleanUp = '2'

    " For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
    " let &guioptions = substitute(&guioptions, "t", "", "g")

    " Remove menus and guioptions
    aunmenu *
    set guioptions-=m
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " For all text files set wrap mode
  autocmd FileType text setlocal wrap
  " For all text files set linebreak mode
  autocmd FileType text setlocal linebreak
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")
"
" ============================ END Vim Basic Settings ========================
"
"
" =================================== Plugin Settings ========================
"

" ropevim (Python-only) options
"let ropevim_vim_completion=1
"let ropevim_extended_complete=1
"
"" XML plugin settings
"let xml_no_auto_nesting=1
"let xml_use_xhtml=1
"
" set LargeFile to 20kB
let g:LargeFile = 0.02
 
"
" ================================= END Plugin Settings ========================
"
"
" ================================= Vundle Settings ============================
"
"
set rtp+=~/.vim/vundle/vundle/
call vundle#rc('~/.vim/vundle')
"
" GitHub repos
" let Vundle manage Vundle
"required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-pathogen'
Bundle 'Lokaltog/powerline'
Bundle 'b4winckler/vim-objc'
Bundle 'Rip-Rip/clang_complete'
" vim-snipmate dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
"Bundle 'honza/snipmate-snippets'
" snipmate, cocoa.vim dependency
Bundle 'garbas/vim-snipmate'
" cocoa.vim
Bundle 'hellhound/cocoa.vim'
Bundle 'vim-scripts/LargeFile'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/nerdtree'
"Bundle 'Lokaltog/vim-powerline'
"Bundle 'kien/rainbow_parentheses.vim'
"Bundle 'rizzatti/funcoo.vim'
"Bundle 'rizzatti/dash.vim'
Bundle 'mattn/emmet-vim'
" vim-issues requirements
Bundle 'tpope/vim-fugitive'
Bundle 'mklabs/vim-issues'
Bundle 'gmarik/github-search.vim'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-repeat'
Bundle 'othree/html5.vim'
"Bundle 'klen/python-mode'
"Bundle 'vim-scripts/pythoncomplete'
"Bundle 'eiginn/netrw'
Bundle 'vim-scripts/netrw.vim'
Bundle 'sjl/gundo.vim'

" vim.org repos

" non-GitHub repos

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
" ================================= END Vundle Settings ========================
"
"
" ================================= Pathogen Settings ==========================
"
"
"execute pathogen#infect('pathogen')
"
"
" ================================= END Pathogen Settings ======================
"
"
" ==================================== Private Settings ========================
"

" Hack for desabling bells and flashes.
autocmd VimEnter * set vb t_vb= 

" we don't need matlab so associate *.m files with Objective-C syntax
" highlighting
"augroup filetypedetect
au! BufNewFile,BufRead *.h,*.m,*.mm setf objc
let filetype_m = 'objc'
"augroup end

" useful syntax highlighting for JSON file editing
"augroup filetypedetect
au! BufNewFile,BufRead *.json setf javascript
"augroup end

" search column 80 characters and highlight them
autocmd BufNewFile,BufRead,WinEnter,BufEnter,
            \FileType python,*.py,javascript,*.js,c,*.c,cpp,*.cpp,*.m,objc,*.h,
            \cs,*.cs,*.md let w:m2=matchadd('ErrorMsg', '\%<82v.\%>81v', -1)

" Required for LargeFile
"" set large file to 15kB
"let g:LargeFile = 0.015

" Required for vim-objc
let g:c_no_curly_error = 1

" Required for clang_complete
"let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"let g:clang_use_library = 1

" Required for vim-powerline
set rtp+=~/.vim/vundle/powerline/powerline/bindings/vim
"python from powerline.bindings.vim import setup as powerline_setup; powerline_setup(); del powerline_setup
let g:Powerline_symbols = 'fancy'

" Search path for github-search.vim 
let g:github_search_path_format = '~/projects/local/:project-:author@git'

" Best colorscheme evar~
colorscheme peachpuff
