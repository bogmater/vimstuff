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

" visual column
set colorcolumn=120

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
" let g:solarized_visibility="normal"
" set background=light
set t_Co=256
colorscheme seoul256-light

" virtualedit
set virtualedit=all

" normal backspace behaviour
set backspace=2

" tab stuff
set expandtab
set shiftwidth=4
set tabstop=4

" fold method
" set foldmethod=syntax

" scrolling
set scrolloff=8

" gui options
set guioptions=ac
set guifont=PragmataPro\ for\ Powerline\ 10

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

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" easier split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" remap ; to : (no more shift holding for commands in normal mode)
nnoremap ; :

" use :w!! to save sudo required files
cmap w!! %!sudo tee > /dev/null %

let g:airline_powerline_fonts = 1

" easier copy/paste
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p

" add a $ character to end of a change
set cpoptions+=$

" nerdtree toggle
map <F1> :NERDTreeToggle<CR>

" ctags binding
nnoremap <f12> :!ctags -R<cr>

" tagbar
nmap <F8> :TagbarToggle<CR>

" search!
noremap <C-f> :copen<CR>:Ack -aQi 

" php syntax checking and mess detection via syntastic
let g:syntastic_php_checkers=['php']

" correct php comments
au Bufenter *.php set comments=sl:/*,mb:*,elx:*/

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" sexy invisible chars
set list listchars=tab:▸\ ,trail:.,eol:¬


" auto-reload .vimrc
au BufWritePost .vimrc so ~/.vimrc

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" remove fold markers from php-docs
let g:pdv_cfg_foldmarker=0

"YouCompleteMe and UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
