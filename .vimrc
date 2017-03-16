" Use ~x on an English Windows version or ~n for French.
if has("win32")
  au GUIEnter * simalt ~x
endif

if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')

    Plug 'mhinz/vim-startify'
    Plug 'shougo/unite.vim'
    Plug 'Shougo/denite.nvim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tomasr/molokai'
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    Plug 'airblade/vim-gitgutter'
    Plug 'Raimondi/delimitMate'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-sensible'
    Plug 'pelodelfuego/vim-swoop'
    Plug 'junegunn/gv.vim'
    Plug 'mbbill/undotree'
    Plug 'shougo/vimproc.vim', {'do': 'make'}
    Plug 'tpope/vim-dispatch'
    Plug 'SirVer/ultisnips'
    "Plug 'Shougo/neocomplete.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'majutsushi/tagbar'
    Plug 'easymotion/vim-easymotion'
    Plug 'morhetz/gruvbox'
    Plug 'honza/vim-snippets'

    "Plug 'omnisharp/omnisharp-vim', {'do': BuildOmniSharp()}
    Plug 'OrangeT/vim-csharp'
    Plug 'Valloric/YouCompleteMe', {'do': 'python3 install.py --all'}

call plug#end()


" **********************************
" General configs goes here!!
filetype plugin indent on
syntax enable
if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        set guifont=Hack\ Regular:h11"
    else
        set guifont=Hack\ 10
    endif
else
    set guifont=Hack:h10
endif
set fileencodings=utf-8,latin1
set encoding=utf-8
set listchars=eol:¬,tab:>·,trail:•,extends:>,precedes:<,space:•
set list
set ff=unix

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set number
set relativenumber

set shiftwidth=4
set smartcase
set smarttab
set autoindent
set tabstop=4
set softtabstop=4
set expandtab
set showcmd
set cursorline
set wildmenu
set showmatch

set foldenable
set foldlevelstart=0
set foldnestmax=10
set foldmethod=syntax

" color scheme config
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" *********************************
" Plugin configs go here!!

" airline config
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

"let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_c = 'WN: %{winnr()}'
let g:airline_section_y = 'BN: %{bufnr("%")} %{&encoding}'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Undotree config
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Omnisharp config
let g:OmniSharp_selector_ui = 'unite'

" YouCompleteMe config
let g:ycm_error_symbol = '^^'
let g:ycm_warning_symbol = '!!'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" *********************************
" All Language settings start here
" C#
augroup csharp_dimixar
    autocmd FileType cs set foldmethod=syntax
    autocmd FileType cs set foldlevelstart=5
    autocmd FileType cs autocmd BufWritePre <buffer> %s/\s\+$//e
augroup END

" *********************************
" All mappings start here
let mapleader = ' '

" Easy copy/paste to/from system clipboard
nnoremap <leader>p "+p
vnoremap <leader>y "+y

" Folding shortcuts
" Toggle fold
nmap <leader>eft za 
" Open All folds
nmap <leader>efO zR
" Close all folds
nmap <leader>efC zM

" file shortcuts (like spacemacs)
nmap <leader>fs :w<CR>:echo "saved file!!!"<CR>

" buffer shortcuts
nmap <leader>bd :bd<CR>:echo "Buffer Killed!!!"<CR>
nmap <leader>bdd :bd!<CR>:echo "Buffer Murdered!!!"
" startify buffer shortcut
nmap <leader>bs :Startify<CR>

" window shortcuts
nmap <leader>wj <C-w>j
nmap <leader>wk <C-w>k
nmap <leader>wh <C-w>h
nmap <leader>wl <C-w>l
nmap <leader>wJ <C-w>J
nmap <leader>wK <C-w>K
nmap <leader>wH <C-w>H
nmap <leader>wL <C-w>L
nmap <leader>w/ <C-w>v
nmap <leader>ws <C-w>s
nmap <leader>wd :hide<CR>
nmap <leader>wtt :NERDTreeToggle<CR>
nmap <leader>wtc :TagbarToggle<CR>
nmap <leader>wu :UndotreeToggle<CR>
nmap <leader>wn <C-w>w
nmap <leader>qq :qa<CR>
nmap <leader>qQ :qa!<CR>

" Unite mappings
nmap <leader>ubl :Unite buffer<CR>i
nmap <leader>upf :Unite file_rec/async:!<CR>i

" Git mappings
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gl :GV<CR>

" Vim swoop config
let g:swoopUseDefaultKeyMap = 0
nmap <leader>ss :call Swoop()<CR>
vmap <leader>ss :call SwoopSelection()<CR>
nmap <leader>ssm :call SwoopMulti()<CR>
vmap <leader>ssm :call SwoopMultiSelection()<CR>

" Omnisharp mappings
"nmap <leader>ma :OmniSharpGetCodeActions<CR>
"vmap <leader>ma :call OmniSharp#GetCodeActions('visual')<CR>
"nmap <leader>mr :OmniSharpRename<CR>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
"command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
"nmap <leader>mrl :OmniSharpReloadSolution<CR>
"nmap <leader>mcf :OmniSharpCodeFormat<CR>
"nmap <leader>mss :OmniSharpStartServer<CR>
"nmap <leader>msp :OmniSharpStopServer<CR>

"YouCompleteMe mappings
nmap <leader>mgd :YcmCompleter GoToDefinition<CR>
nmap <leader>mgi :YcmCompleter GoToInclude<CR>
nmap <leader>mgde :YcmCompleter GoToDeclaration<CR>
nmap <leader>mfu :YcmCompleter GoToReferences<CR>
nmap <leader>mfi :YcmCompleter GoToImplementation<CR>
nmap <leader>mft :YcmCompleter GetType<CR>
nmap <leader>mfp :YcmCompleter GetParent<CR>
nmap <leader>mfd :YcmCompleter GetDoc<CR>
nmap <leader>mrf :YcmCompleter FixIt<CR>
nmap <leader>mrr :YcmCompleter RefactorRename 
nmap <leader>mss :YcmCompleter RestartServer<CR>
nmap <leader>msr :YcmCompleter ReloadSolution<CR>
nmap <leader>mgse :call youcompleteme#GetErrorCount()<CR>
nmap <leader>mgsw :call youcompleteme#GetWarningCount()<CR>


