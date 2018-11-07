" lorwyn/morningtide configuration for neovim
"

" point to proper python3 binary
let g:python3_host_prog = '/usr/local/bin/python3'

" begin vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Swift syntax and indent files
" Plug 'https://github.com/keith/swift.vim.git'

" lightline, airline alternative
Plug 'itchyny/lightline.vim'

" fzf.vim
Plug '/usr/local/opt/fzf' " fzf location
Plug 'junegunn/fzf.vim'

" rainbow parentheses improved
Plug 'https://github.com/luochen1990/rainbow.git'

" fireplace.vim, clojure repl support
Plug 'https://github.com/tpope/vim-fireplace.git'


" set 'path' for the java class path
Plug 'https://github.com/tpope/vim-classpath.git'

" static support for leiningen and boot
Plug 'https://github.com/tpope/vim-salve.git'

" asynchronous build and test dispatcher, used for fireplace/salve
Plug 'https://github.com/tpope/vim-dispatch'

" paredit, parenthesis support for clojure/lisps/etc
Plug 'https://github.com/vim-scripts/paredit.vim.git'

" cljfmt, formatter for clojure code
Plug 'https://github.com/venantius/vim-cljfmt.git'

" syntastic, syntax checking hacks for vim
Plug 'https://github.com/vim-syntastic/syntastic.git'

" monokai pro
Plug 'phanviet/vim-monokai-pro'
" Plug 'Erichain/vim-monokai-pro'

" vim clojure static
Plug 'guns/vim-clojure-static'

" vim git gutter
Plug 'airblade/vim-gitgutter'

" vim-fugitive
Plug 'tpope/vim-fugitive'

" end vim-plug
call plug#end()

" Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['#777777', '#ff0080', '#89cff0', '#aa88ff'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'clojure': {
	\			'guifgs': ['#777777', '#ff0080', '#89cff0', '#aa88ff'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
        \		'swift': { 'guifgs': ['#ff0080'] },
	\	}
	\}

" fzf colors
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" lightline
" colorschemes: wombat, seoul256, jellybeans
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Paredit
let g:paredit_mode = 1
au BufNewFile,BufRead * call PareditInitBuffer()

" Misc
set number
" relative number
set relativenumber
"hi CursorLineNR cterm=bold
" augroup CLNRSet
"    autocmd! ColorScheme * hi CursorLineNR cterm=bold gui=bold
"augroup END
set nocompatible
let mapleader=" "
set hidden	" allows changing buffers without saving
let g:loaded_matchparen=1
filetype plugin indent on

" omnicomplete
set omnifunc=syntaxcomplete#Complete
autocmd CompleteDone * pclose

" Theme
if !has('gui_running')
  set t_Co=256
endif

syntax on
set background=dark
" colorscheme jellybeans
"colorscheme seti
"colorscheme gruvbox
colorscheme monokai_pro
set cursorline
set noshowmode
set termguicolors
" set linespace=2
" enable mouse scrolling within tmux and vim
" update time set to 100ms, rather than default of 4s
set updatetime=100
" set textwidth=80
" set colorcolumn=80
" colors match to jellybeans theme only
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" mouse related
set mouse=a

" syntax specific
highlight Comment gui=italic cterm=italic
highlight htmlArg gui=italic cterm=italic

" Mappings
nmap <Leader>b :Buffers<CR>
nmap <Leader>c :Commands<CR>
nmap <Leader>s :Colors<CR>
nmap <Leader>f :FZF<CR>
nmap <Leader>p :History<CR>
nmap <Leader>w :Windows<CR>
nmap <Tab> i<C-t><Esc>
nmap <S-Tab> i<C-d><Esc>
vmap <Tab> :><CR>gv
vmap <S-Tab> :<<CR>gv
nmap <F3> :bp<CR>
nmap <F4> :bn<CR>

" autocomplete (control space)
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>

" disables highlighting of recent search matches
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Commands
command! Trim :%s/\s\+$//e
command! Macdown :execute ':silent !macdown %'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" point to proper python3 binary
let g:python3_host_prog = '/usr/local/bin/python3'

" enable italics
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"

" eof
