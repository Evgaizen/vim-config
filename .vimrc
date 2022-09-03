set number
set relativenumber
set tabstop=4
set shiftwidth=4
syntax enable
set mouse=a
set updatetime=250
set nowrap
set scrolloff=8
set hidden
set backspace=eol,start,indent
set incsearch
set nobackup
set nowb
set noswapfile
set re=0
set encoding=UTF-8
set guifont=JetBrains\ Mono:h14
let $FZF_DEFAULT_COMMAND="rg --files -g '!node_modules'"
"
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
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'neoclide/coc-eslint'
 Plug 'jiangmiao/auto-pairs'
 Plug 'editorconfig/editorconfig-vim'
 Plug 'morhetz/gruvbox'
call plug#end()

" Coc config
let g:coc_global_extensions = ['coc-tsserver', 'coc-css', 'coc-eslint']
autocmd CursorHold * silent call CocAction('showSignatureHelp')
nnoremap <silent> K :call ShowDocumentation()<CR>
inoremap <silent><expr> <c-@> coc#refresh()
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Airline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create('%3p%% %#__accent_bold#%4l%#__restore__#%#__accent_bold#/%L%#__restore__# %3v')

" Nerdtree navigation
nnoremap nn :NERDTreeToggle<CR>
nnoremap nf :NERDTreeFind<CR>

" FZF map
nnoremap ff :Files<CR>
nnoremap fl :BLines<CR>
nnoremap fw :Rg<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!node_modules" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Keymap Coc
nmap <silent> ga  <Plug>(coc-codeaction)
nmap <silent> gf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Buffers
nmap <silent> bn :bn<CR>
nmap <silent> bp :bp<CR>
nmap <silent> bd :bd<CR>

" Theme
autocmd vimenter * ++nested colorscheme gruvbox
