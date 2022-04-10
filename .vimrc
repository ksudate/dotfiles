"""" PLUGIN

call plug#begin()
  Plug 'prabirshrestha/vim-lsp'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'gkeep/iceberg-dark'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'mattn/vim-sonictemplate'
  Plug 'thinca/vim-quickrun'
  Plug 'ConradIrwin/vim-bracketed-paste'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'tmrekk121/prev-md.vim'
  Plug 'lambdalisue/fern.vim'
  Plug 'bkad/CamelCaseMotion'
  Plug 'thinca/vim-qfhl'
  Plug 'thinca/vim-qfreplace'
  Plug 'tyru/eskk.vim'
  Plug 'mileszs/ack.vim'
  Plug 'hashivim/vim-terraform'
call plug#end()

"""" LSP

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
  nmap <buffer> gtd <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> K <plug>(lsp-hover)
endfunction
autocmd BufWritePre *.go call execute('LspDocumentFormatSync')
let mapleader = "\<Space>"

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" yaml-language-server
let g:lsp_settings = {
  \  'efm-langserver': {
  \    'disabled': v:false,
  \  },
  \  'yaml-language-server': {
  \     'workspace_config': {
  \       'yaml': {
  \         'format': { 'enable': v:true },
  \         'hover': v:true,
  \         'customTags': [
  \            '!And scalar',
  \            '!And mapping',
  \            '!And sequence',
  \            '!If scalar',
  \            '!If mapping',
  \            '!If sequence',
  \            '!Not scalar',
  \            '!Not mapping',
  \            '!Not sequence',
  \            '!Equals scalar',
  \            '!Equals mapping',
  \            '!Equals sequence',
  \            '!Or scalar',
  \            '!Or mapping',
  \            '!Or sequence',
  \            '!FindInMap scalar',
  \            '!FindInMap mappping',
  \            '!FindInMap sequence',
  \            '!Base64 scalar',
  \            '!Base64 mapping',
  \            '!Base64 sequence',
  \            '!Cidr scalar',
  \            '!Cidr mapping',
  \            '!Cidr sequence',
  \            '!Ref scalar',
  \            '!Ref mapping',
  \            '!Ref sequence',
  \            '!Sub scalar',
  \            '!Sub mapping',
  \            '!Sub sequence',
  \            '!GetAtt scalar',
  \            '!GetAtt mapping',
  \            '!GetAtt sequence',
  \            '!GetAZs scalar',
  \            '!GetAZs mapping',
  \            '!GetAZs sequence',
  \            '!ImportValue scalar',
  \            '!ImportValue mapping',
  \            '!ImportValue sequence',
  \            '!Select scalar',
  \            '!Select mapping',
  \            '!Select sequence',
  \            '!Split scalar',
  \            '!Split mapping',
  \            '!Split sequence',
  \            '!Join scalar',
  \            '!Join mapping',
  \            '!Join sequence'
  \          ],
  \       },
  \     },
  \   },
  \ }

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
set scrolloff=3
set lazyredraw
set ttyfast
"set cursorline
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
"let g:airline_disable_statusline = 1

set showmatch
set visualbell
" 改行時に前の行のインデントを計測
set autoindent
" {があると次の行は自動で1段深く自動インデントしてくれる
set smartindent
set expandtab
set hlsearch
set ignorecase
set incsearch
set smartcase

set wildmenu
set listchars=tab:»-,trail:･
set splitright
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
autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
autocmd FileType yml         setlocal sw=2 sts=2 ts=2 et
autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et
autocmd FileType cue        setlocal sw=2 sts=2 ts=2 et
" Fern setting
map <C-n> :Fern . -drawer -toggle<CR>
" Quickrun Setting
map <leader>q :QuickRun<CR>
" vim-fugitive Setting
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Gclog<CR>
let g:sonictemplate_vim_template_dir = [
      \ '~/dotfiles/template'
      \]
" eskk.vim
let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}

let g:auto_prev_time = 7000
let g:prev_md_auto_update = 1

let g:camelcasemotion_key = '<leader>'
nmap <Esc><Esc> :nohl<CR>

" quickfix-windowのデフォルトの表示位置を左端に変更
autocmd FileType qf wincmd H
" quickfix-windowを開き、modifiableに設定し、Windowサイズを調整
function! OpenQuickfixWindow()
        cw
        set modifiable
        vertical resize 70
endfunction

autocmd QuickfixCmdPost vimgrep call OpenQuickfixWindow()
