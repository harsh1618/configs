" needed for some vim features
set nocompatible

let mapleader=" "

" required for vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Bundle 'gmarik/Vundle.vim'

Bundle 'Valloric/YouCompleteMe'
"Bundle 'Valloric/ListToggle'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'jpalardy/vim-slime'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-eunuch'
"Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'ivanov/vim-ipython'
Bundle 'tpope/vim-fugitive'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Raimondi/delimitMate'
"Bundle 'ntpeters/vim-better-whitespace'
Bundle 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'shiracamus/vim-syntax-x86-objdump-d'
Plugin 'kchmck/vim-coffee-script'
if has("ruby")
    Plugin 'lukaszkorecki/CoffeeTags'
endif
Plugin 'cbracken/vala.vim'
"Plugin 'L9'
"Plugin 'FuzzyFinder'

" colorschemes
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'croaker/mustang-vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'sjl/badwolf'
Bundle 'vim-scripts/twilight'
Bundle 'trusktr/seti.vim'
Bundle 'effkay/argonaut.vim'
Bundle 'vim-scripts/Wombat'
Bundle 'joshdick/onedark.vim'
Bundle 'joshdick/airline-onedark.vim'
Bundle 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

" show line numbers
set nu
" relative numbering
set rnu
" toggle line numbering
noremap <F4> :set invnu invrnu<CR>
" show line number and column number
set ru

" tab width
set softtabstop=4
set shiftwidth=4
nnoremap <Leader>2 :set sw=2 <Bar> set sts=2<CR>
nnoremap <Leader>4 :set sw=4 <Bar> set sts=4<CR>

" insert spaces instead of tab character
" to insert a real tab use: CTRL-V<Tab>
set expandtab

" capitalize the word preceding the cursor in insert mode
imap <C-F> <Esc>gUiw`]a

" syntax highlighting
sy on

" automatic indent options
" set cindent
set autoindent
set smartindent

" toggle cursor column highlighting
nnoremap <Leader>v :set invcursorcolumn<CR>

" case insensitive patterns
" prefix with \C for case sensitive matching
set ignorecase
set smartcase

" show command being typed in normal mode
set showcmd

" incremental search
set incsearch
" highlight matched strings
set hlsearch
" remove highlighting
nnoremap `` :noh<CR>

set mouse=a

" map : to ; and vice-versa
" so you don't have to hold down shift to get into command mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Go to next/previous line beginning with a word character,
" hopefully a function declaration
noremap ]] /^\w<CR>:noh<CR>
noremap [[ ?^\w<CR>:noh<CR>

" 0 to go to first non-whitespace character
nnoremap 0 ^
nnoremap ^ 0

inoremap jj <Esc>

" repeat last defined macro, Bonus: no Ex mode
nnoremap Q @@

" save file with sudo privileges
noremap <Leader>w :w !sudo tee > /dev/null %<CR>

" show diff of current buffer with last saved version
noremap <Leader>d :w !diff % -<CR>

" minimum number of lines after/before current line on the screen
set scrolloff=5

" toggle paste mode and display current value
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

" toggle nerd-tree window
noremap <Leader>n :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.o$', '\.cmi$', '\.cmo$', '\.cmt$', '\.cmti$', '\.annot$', '\.cmx$']
let g:NERDTreeWinSize=20
let g:NERDTreeMouseMode=3

" don't abandon buffers when unloading
set hidden

" set t_Co=256
let g:onedark_terminal_italics = 1
colorscheme onedark
"let g:airline_powerline_fonts = 1
let g:airline_theme="powerlineish"
let g:airline#extensions#whitespace#enabled = 0
let g:airline_right_sep = ""
let g:airline_left_sep = ""

" split vertically for diffs
set diffopt+=vertical
" open new vertical split on right side
set splitright

" hide toolbar in gvim
set guioptions-=T
" hide scrollbars
set go-=rL
" hide menu bar
set go-=m

" YCM options
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1
noremap <Leader>j :YcmCompleter GoToDefinition<CR>

set tags+=../tags

" avoid backspace problems
set backspace=indent,eol,start

" toggle taglist window
nnoremap <Leader>t :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File=1
let Tlist_WinWidth=40
let Tlist_Enable_Fold_Column = 0

" toggle gundo
nnoremap <Leader>u :GundoToggle<CR>

" indent guides
nnoremap <Leader>i :IndentGuidesToggle<CR>

" yank till end of line
nnoremap Y y$

"grep options
set grepprg=grep\ --exclude=tags\ --exclude=cscope.out\ -n\ -I\ $*\ /dev/null
" search for the word under the cursor
nnoremap <Leader>g :grep <C-R><C-W> *<CR>
nnoremap <Leader>r :grep -r <C-R><C-W> *<CR>
nnoremap <Leader>cw :belowright cwindow<CR>

"CtrlP ignore files
let g:ctrlp_custom_ignore='.*\.o$\|.*\.ll$\|.*\.rst$\|.*\.txt$'

" use vim's pwd
let g:ctrlp_working_path_mode = 'a'

" Remember cursor position
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Remember undo history
set undofile
set undodir=~/.vim/undodir

let tlist_vala_settings='c#;d:macro;t:typedef;n:namespace;c:class;'.
  \ 'E:event;g:enum;s:struct;i:interface;'.
  \ 'p:properties;m:method'

set title

" OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"

let delimitMate_expand_cr = 1

let g:easytags_async = 1
let g:easytags_auto_highlight = 0

source ~/.vim_cscope
