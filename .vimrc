" cosmtrek's vimrc
call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/neomru.vim'
Plug 'tsukkee/unite-tag'
Plug 'cosmtrek/vim-fastunite'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/NERDCommenter'
Plug 'tpope/vim-dispatch'

Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/syntastic'
Plug 'fatih/vim-go'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
call plug#end()

set nocompatible
filetype plugin indent on
syntax enable
syntax on
set encoding=utf8
let $LANG='en'
set langmenu=en
set wildmenu
set wildmode=list:full
set wildignorecase
set laststatus=2
set backspace=eol,start,indent
set autoread
set autowrite
set nobackup
set nowb
set noswapfile
set ruler
set cmdheight=2
set hidden
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set history=100
set gcr=a:blinkon0
set noerrorbells
set novisualbell
set t_vb=
set numberwidth=2
set scrolloff=5
set mouse=a
set ffs=unix,dos,mac
set lazyredraw
set ttyfast
set pumheight=20
set timeout timeoutlen=5000 ttimeoutlen=100

function! s:SID_PREFIX() abort
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
set title titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif

if has('conceal')
    set conceallevel=1
    set listchars+=conceal:Δ
endif

if has("gui_running")
	set guioptions-=T   "toolbar
	set guioptions-=r   "scrollbar
	set guioptions-=L
	set guioptions-=e
	set guioptions-=b
	set guioptions-=m   "menubar
	set t_Co=256
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12
endif

" color options
if has("gui_running")
    colorscheme solarized
    set background=light
else
    colorscheme Tomorrow-Night-Eighties
    set background=dark
endif

let mapleader = "\<Space>"
nnoremap <space> <nop>
inoremap jk <esc>

augroup MyAutoCmd
    autocmd!
augroup END

" Disable paste
autocmd MyAutoCmd InsertLeave *
      \ if &paste | setlocal nopaste | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif

" Update diff
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
" Remap VIM 0 to first non-blank character
map 0 ^
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Paste in a new line
nnoremap P :pu<cr>

" Close the current buffer and move to the previous one
nnoremap <leader>bq :bp <BAR> bd #<cr>
nnoremap <leader>j :bprev<cr>
nnoremap <leader>k :bnext<cr>

" Useful mappings for managing tabs
map <leader>tc :tabclose<cr>
map <leader>, :tabprev<cr>
map <leader>. :tabnext<cr>
map te :tabedit<space>
map th :tab<space>help<space>

" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" More natural split opening
set splitbelow
set splitright
set winwidth=30
set winheight=1
set previewheight=8
set helpheight=12

" Resize windows
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Smart way to move between windows
" <C-W>r swap the only two windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Copy & paste to system clipboard
set clipboard=unnamed
"vnoremap <Leader>y "+y
"vnoremap <Leader>d "+d
"nnoremap <Leader>p "+p
"nnoremap <Leader>P "+P
"vnoremap <Leader>p "+p
"vnoremap <Leader>P "+P

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" :W sudo saves the file
command W w !sudo tee % > /dev/null

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
autocmd BufRead,BufNewFile *.c set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.h set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.m set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.py set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.js set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.css set ts=2 sw=2 et sts=2
autocmd BufRead,BufNewFile *.scss set ts=2 sw=2 et sts=2
autocmd BufRead,BufNewFile *.html set ts=4 sw=4 et sts=4
autocmd BufRead,BufNewFile *.xml set ts=4 sw=4 et sts=4 ai
autocmd BufRead,BufNewFile *.json set ts=4 sw=4 et sts=4 ai
autocmd BufRead,BufNewFile *.rb set ts=2 sw=2 et sts=2 ai
autocmd BufRead,BufNewFile *.go set ts=4 sw=4 ai
autocmd BufRead,BufNewFile *.yml set ts=2 sw=2 et sts=2 ai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startify
let g:startify_custom_header =
  \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val')

" vim-better-whitespace
highlight ExtraWhitespace ctermbg=Red
autocmd BufWritePre * StripWhitespace

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

" Unite
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    nmap <silent><buffer><expr> Enter unite#do_action('switch')
    nmap <silent><buffer><expr> <C-t> unite#do_action('tabswitch')
    nmap <silent><buffer><expr> <C-h> unite#do_action('splitswitch')
    nmap <silent><buffer><expr> <C-v> unite#do_action('vsplitswitch')

    imap <silent><buffer><expr> Enter unite#do_action('switch')
    imap <silent><buffer><expr> <C-t> unite#do_action('tabswitch')
    imap <silent><buffer><expr> <C-h> unite#do_action('splitswitch')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplitswitch')

    nnoremap <esc> :UniteClose<cr>
endfunction

" Gitgutter
set updatetime=500
let g:gitgutter_sign_column_always = 1
let g:gitgutter_eager = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol = '>>'
let g:syntastic_warning_symbol = '>'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Neocomplete
set completeopt-=preview
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=go#complete#Complete
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }
let g:go_list_type = "quickfix"
let g:golang_goroot="/usr/local/go"

