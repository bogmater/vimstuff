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
" set colorcolumn=120

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
let g:solarized_visibility="low"
set background=light
colorscheme solarized

" virtualedit
set virtualedit=all

" normal backspace behaviour
set backspace=2

" tab stuff
set expandtab
set shiftwidth=4
set tabstop=4

" fold method
set foldmethod=syntax

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

" status line configuration
set ls=2 " always show status line

" powerline settings
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode

" search!
noremap <C-f> :copen<CR>:Ack -aQi 

" php syntax checking and mess detection via syntastic
let g:syntastic_php_checkers=['php', 'phpmd']

" php documentor settings
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates"

autocmd FileType php inoremap <C-c> <ESC>:call pdv#DocumentCurrentLine()<CR>i
autocmd FileType php nnoremap <C-c> :call pdv#DocumentCurrentLine()<CR>
autocmd FileType php vnoremap <C-c> :call pdv#DocumentCurrentLine()<CR>

" correct php comments
au Bufenter *.php set comments=sl:/*,mb:*,elx:*/

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" neosnippet key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like neosnippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" php autocomplete
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP


" sexy invisible chars
set list listchars=tab:▸\ ,trail:.,eol:¬


" auto-reload .vimrc
au BufWritePost .vimrc so ~/.vimrc
