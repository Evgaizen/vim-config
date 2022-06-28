set relativenumber
set tabstop=4
set shiftwidth=4
syntax enable
set mouse=a
set nowrap
set scrolloff=8
set hidden
set backspace=eol,start,indent
set incsearch
set nobackup
set nowb
set noswapfile

" Cursor shape in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Plugins
call plug#begin('~/.vim/plugged')
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'pangloss/vim-javascript'
	Plug 'leafgarland/typescript-vim'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'
	Plug 'mihaifm/bufstop'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc-eslint'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-commentary'
	Plug 'wookayin/fzf-ripgrep.vim'
	Plug 'prettier/vim-prettier', {
	  \ 'do': 'yarn install --frozen-lockfile --production',
	  \ 'branch': 'release/0.x'
	  \ }

call plug#end()

" Coc config
let g:coc_global_extensions = ['coc-tsserver']

" Airline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create('%3p%% %#__accent_bold#%4l%#__restore__#%#__accent_bold#/%L%#__restore__# %3v')

" Theme
