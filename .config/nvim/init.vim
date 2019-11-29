"""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""

set nocompatible
filetype plugin on
call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'morhetz/gruvbox'

" General
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sbdchd/neoformat'
Plug 'breuckelen/vim-resize'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'eugen0329/vim-esearch'
Plug 'ntpeters/vim-better-whitespace'

" Code intel
Plug 'hashivim/vim-terraform'
Plug 'scrooloose/syntastic'
Plug 'ambv/black'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Raimondi/delimitMate'
Plug 'digitaltoad/vim-pug'
Plug 'kchmck/vim-coffee-script'
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
Plug 'tpope/vim-jdaddy'
Plug 'leafgarland/typescript-vim'
Plug 'stevearc/vim-arduino'
Plug 'dzeban/vim-log-syntax'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
" Build
Plug 'dylanaraps/taskrunner.nvim'

" Editing
Plug 'Yggdroot/indentLine'

call plug#end()

" Colorscheme
set background=dark
colorscheme gruvbox

""""""""""""""""""""""""""""
" Plugs settings
""""""""""""""""""""""""""""

" vim-go
let g:go_term_mode = "split"
let g:godef_split = 0
let g:go_fmt_fail_silently = 1
let g:go_list_type = 'quickfix'

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['flake8', 'mypy']

let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']
let g:syntastic_python_flake8_post_args = '--ignore=F403,E402,W503 --max-line-length=88'

let g:syntastic_python_mypy_post_args = '--ignore-missing-imports'

let g:syntastic_coffee_checkers = ['coffee', 'coffeelint']
let g:syntastic_coffee_coffeelint_args = "--file ~/.config/coffeelint.json"
let g:syntastic_pug_checkers = ['pug_lint']

let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter', 'gofmt']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']

" ctrlp
let g:ctrlp_show_hidden = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
let g:deoplete#sources#go#unimported_packages = 1
let g:deoplete#sources#go#source_importer = 1
let g:deoplete#sources#go#builtin_objects = 1
"set completeopt-=preview

" jedi-vim
autocmd FileType python setlocal completeopt-=preview

" black formatting
"let g:black_linelength = 100
autocmd BufWritePre *.py execute ':Black'

" gitgutter
let g:gitgutter_enabled = 1

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1

"""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""

" Formating
set autoindent
set backspace=indent,eol,start
set expandtab
"set formatoptions+=t  " Hard wrap text using textwidth
set formatoptions-=o  " Don't continue comments when inserting lines set
set nojoinspaces
set ts=4 sw=4 sts=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Visual

set number
set ruler

" Autoread

set autoread
au CursorHold * checktime

" Clipboard

set clipboard^=unnamed
set clipboard^=unnamedplus

"""""""""""""""""""""""""
" Keybindings
""""""""""""""""""""""""

" Leader Key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <Space> <Nop>
let mapleader = " "
