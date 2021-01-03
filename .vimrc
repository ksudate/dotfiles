call plug#begin()
Plug 'preservim/nerdtree'
Plug 'prabirshrestha/vim-lsp'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gkeep/iceberg-dark'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-goimports'
Plug 'mattn/vim-sonictemplate'
Plug 'thinca/vim-quickrun'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

" vim-lsp setting
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
"  nmap <buffer> [g
"  <Plug>(lsp-previous-diagnostic)
"  nmap <buffer> ]g
"  <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
endfunction
let mapleader = "\<Space>"

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" vimgrep
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

set encoding=utf-8
set autoread
scriptencoding utf-8
filetype plugin indent on
set noswapfile
set history=200
set number
set cursorline
set clipboard=unnamed
set backspace=indent,eol,start

nnoremap <CR> A<CR><ESC>

" 縦棒カーソル
let &t_SI .= "\e[6 q"
let &t_EI .= "\e[1 q"
let &t_SR .= "\e[4 q"

syntax enable
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme iceberg
let g:airline_theme='icebergDark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_a = airline#section#create(['mode'])
let g:airline#extensions#default#layout = [
  \ [ 'a', 'c' ],
  \ [ 'z']
  \ ]
let g:airline_section_z = airline#section#create(['linenr'])
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0

set showmatch
set laststatus=2
set autoread
set visualbell
" 改行時に前の行のインデントを計測
set autoindent
" {があると次の行は自動で1段深く自動インデントしてくれる
set smartindent
set wildmenu
set showtabline=1
set listchars=tab:»-,trail:･
set foldmethod=indent
autocmd BufRead * normal zR
" 空白
autocmd BufWritePre * :%s/\s\+$//ge
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
" 拡張子でインデントを変化
autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
autocmd FileType go          setlocal sw=2 sts=2 ts=2 et
autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
autocmd FileType c           setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
autocmd FileType vim         setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh         setlocal sw=2 sts=2 ts=2 et
autocmd FileType yml         setlocal sw=2 sts=2 ts=2 et
autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et
" NERDTree setting
map <C-n> :NERDTreeToggle<CR>

let g:sonictemplate_vim_template_dir = [
      \ '~/dotfiles/template'
      \]
