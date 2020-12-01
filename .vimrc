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
call plug#end()

" vim-lsp setting
"let g:lsp_diagnostics_enabled = 1
"let g:lsp_signs_enabled = 1
"let g:lsp_diagnostics_echo_cursor = 1
"let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_auto_completeopt = 0
"let g:asyncomplete_popup_delay = 200
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g
  <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g
  <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)

endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

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
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" 括弧補完
"inoremap { {}<LEFT>
"inoremap {<Enter> {}<LEFT><CR><BS><ESC><S-o>
"inoremap ( ()<LEFT>
"inoremap (<Enter> ()<LEFT><CR><BS><ESC><S-o>
"inoremap [ []<LEFT>
"inoremap [<Enter> []<LEFT><CR><BS><ESC><S-o>
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

" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" ビープ音を可視化
set visualbell
" 改行時に前の行のインデントを計測
set autoindent
" {があると次の行は自動で1段深く自動インデントしてくれる
set smartindent
" コマンドライン補完
set wildmenu
" タブバー
set showtabline=1
" 不可視文字の表示
set listchars=tab:»-,trail:･

" 拡張子でインデントを変化
autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
autocmd FileType go          setlocal sw=2 sts=2 ts=2 et
autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
autocmd FileType c           setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
autocmd FileType vim         setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh         setlocal sw=2 sts=2 ts=2 et

" NERDTree setting
map <C-n> :NERDTreeToggle<CR>

let g:sonictemplate_vim_template_dir = [
      \ '~/dotfiles/template'
      \]
