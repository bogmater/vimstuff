call pathogen#infect()

" break compatibility with vi
set nocompatible

" buffers can exist in background
set hidden

" enable inline spellcheck
" set spell
" set spelllang=en

" enable line number
set nu

" show line and column markers
" set cursorline
" set cursorcolumn

" enable soft word wrap
set formatoptions=1
set lbr

" move by screen lines, not by real lines
nnoremap j gj
nnoremap k gk

" also in visual mode
vnoremap j gj
vnoremap k gk

"stuff useful for coding
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" colorscheme
set background=dark
colorscheme solarized

" virtualedit
set virtualedit=all

" scrolling 
" set scrolloff=8

" gui options
set guioptions=ac
set guifont=Droid\ Sans\ Mono\ 11

" hide the mouse while typing
set mousehide

" keep some stuff in the history
set history=100

set autoindent
" copy previous indent on enter
set copyindent
set smartindent

set showcmd " show (partial) command in status line
set showmatch " show matching brackets
set ignorecase " do case insensitive matching
set smartcase " do smart case matching

set incsearch " incremental search
set hlsearch " highlight searches

" pressing \<space> clears the search highlights
nmap <silent> <leader><space> :nohlsearch<CR>

"no swap file cluttering
set noswapfile
set nobackup
set nowb

" use jj to quickly escape to normal mode
inoremap jj <ESC>


" remap ; to : (no more shift holding for commands in normal mode)
nnoremap ; :

" easier copy/paste
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p

" add a $ character to end of a change 
set cpoptions+=$

" ctags binding
nnoremap <f12> :!ctags -R<cr>


" status line configuration
set ls=2 " always show status line
if has('statusline')
	function SetStatusLineStyle()
		if &stl == '' || &stl =~ 'synID'
         		let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=buff:#%n line:%l/%L col:%c%V "
		else
         		let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=buff:#%n line:%l/%L col%c%V "
		endif
	endfunc
	nmap _ds :call SetStatusLineStyle()<CR>
	call SetStatusLineStyle()
	" window title
	if has('title')
		set titlestring=%t%(\ [%R%M]%)
	endif
endif
" end status line configuration

let g:haddock_docdir = "/usr/share/doc/ghc-haddock/"
