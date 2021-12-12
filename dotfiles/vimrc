"Plugins
call plug#begin('~/.vim/plugged')
" Commenter
Plug 'preservim/nerdcommenter'
" Emmet (HTML and CSS autocomplite)
Plug 'mattn/emmet-vim'
" Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Colorsheme
Plug 'nanotech/jellybeans.vim'
call plug#end()

"Theme
colorscheme jellybeans

" Theme overrides
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
	g:jellybeans_overrides['background']['guibg'] = 'none'
endif 

" Change gitgutter plugin highlight
let g:gitgutter_highlight_lines = 0

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "jellybeans"

" save all temporary files in one dir, make it if it does not exist
if ! isdirectory($HOME . "/.vim")
	call mkdir($HOME . "/.vim")
endif
if ! isdirectory($HOME . "/.vim/tmp")
	call mkdir($HOME . "/.vim/tmp")
endif
set directory=~/.vim/tmp/
set backupdir=~/.vim/tmp/

"Settings
syntax on
filetype plugin indent on

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType cpp,c,sh,bash,zsh,html,css setlocal shiftwidth=4 softtabstop=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"set smartindent							" not recommended
set autoindent
set scrolloff=5

"set expandtab								" tab emulates 4 spaces
set shiftwidth=8
set tabstop=8

set ignorecase
set smartcase
set incsearch

set wildmenu								" completion menu
set wildmode=list:longest,full				" complete longest first

set number
set relativenumber
set linespace=0
set cursorline								" add line with cursos highlighting

set splitbelow
set splitright

" Enable mouse if exist
if has('mouse')
  set mouse=a
endif

" Enable unicode if available
if has('multi_byte')
	set encoding=utf-8
	setglobal fileencoding=utf=8
	set fileencodings=ucs-bom,utf-8,latin1
endif

" Key binds
" Bind paste mode enabling to F12
set pastetoggle=<F12>

" Load vimrc.local if available
if filereadable("/etc/vim/vimrc.local")
	source /etc/vim/vimrc.local
endif
