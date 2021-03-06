" => Global

set nocompatible
syntax enable
filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500
set number
"set relativenumber
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=4
set ruler
set cmdheight=2
set foldcolumn=1

" Backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

set showmatch
set mat=2

" Sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Clipboard
set clipboard=unnamedplus " Use "+y to copy from vim

" Returns to last edit position when opening files | Remember
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=80
set encoding=utf8
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 80 characters
set lbr
set tw=80

" Linebreak on 500 characters for tex files only
autocmd FileType tex setlocal tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Finding Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when tab complete
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set completeopt=menu,menuone,preview,noselect,noinsert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'w0rp/ale'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete

Plug 'luochen1990/rainbow'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sheerun/vim-polyglot'

Plug 'lervag/vimtex'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Default: <leader>c<space> NERDCommenterToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#ale#enabled = 1

let g:deoplete#enable_at_startup = 1

let g:ale_completion_enabled = 1

" Keeps the gutter always 
let g:ale_sign_column_always = 1

" Error
let g:ale_sign_error = '✘'

" Warning
let g:ale_sign_warning = '!!'

let g:ale_set_highlights = 0 

let g:ale_lint_on_save = 1

" let g:ale_echo_cursor = 0

" Clear the BG color that Ale sets
highlight clear ALEErrorSign
highlight clear ALEWarningSign

"function! LinterStatus() abort
    "let l:counts = ale#statusline#Count(bufnr(''))

    "let l:all_errors = l:counts.error + l:counts.style_error
    "let l:all_non_errors = l:counts.total - l:all_errors

    "return l:counts.total == 0 ? '' : printf(
    "\   '[%d!! %d✘]  ',
    "\   all_non_errors,
    "\   all_errors
    "\)
"endfunction

"set statusline=%{LinterStatus()}

let g:ale_echo_msg_error_str = '✘'
let g:ale_echo_msg_warning_str = '!!'
let g:ale_echo_msg_format = '%linter%: %s'

let b:ale_warn_about_trailing_whitespace = 1

let g:ale_virtualenv_dir_names = []

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => DEOPLETE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GIT GUTTER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:gitgutter_map_keys = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Indent Guide
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_extensions = []
let g:airline_theme='dracula'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimtex :h vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_enabled=1
let g:vimtex_complete_enabled=1
let g:vimtex_complete_close_braces=1

" Necessary for autocompletion to work, also requires deoplete to work
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell Error
highlight SpellBad ctermbg=13 ctermfg=0

" ColorColumn
highlight ColorColumn ctermbg=8

" Search
hi Search ctermbg=cyan
hi Search ctermfg=black

" Vimdiff colors
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=13 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=13 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=13 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Matching Parenteses
hi! MatchParen cterm=bold ctermfg=14 ctermbg=8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" Spell Check
" z= to cycle between suggestions
nnoremap <leader>ss :setlocal spell! spelllang=en_us<cr>

" Save
nmap <leader>w :w!<cr>

" Buffer Navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffer
nnoremap <leader>bf :ls<cr>:b<Space>
nnoremap <leader>bb :b#
map <leader>bl :bnext<cr>
map <leader>bh :bprevious<cr>
nnoremap <leader>bq :bd<cr>

" Clear highlight, mainly from search
nmap <leader>/ :noh<cr>

" Exit INSERT mode into NORMAL mode
inoremap ji <Esc>

" Copy & Paste
noremap <leader>y "+y
noremap <leader>p "+p
