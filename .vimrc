" Use ~x on an English Windows version or ~n for French.
if has("win32")
  au GUIEnter * simalt ~x
endif

if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')

    Plug 'mhinz/vim-startify'
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
    Plug 'vim-syntastic/syntastic'
    Plug 'majutsushi/tagbar'
    Plug 'easymotion/vim-easymotion'
    Plug 'morhetz/gruvbox'
    Plug 'honza/vim-snippets'

    Plug 'omnisharp/omnisharp-vim', { 'do': 'cd server && xbuild' }
    Plug 'OrangeT/vim-csharp'
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    Plug 'Robzz/deoplete-omnisharp'
    Plug 'ervandew/supertab'
    Plug 'idanarye/vim-merginal'

call plug#end()


" **********************************
" General configs goes here!!
filetype plugin indent on
syntax enable
GuiFont Hack:h10
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
set lazyredraw

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

" OmniSharp config
let g:OmniSharp_selector_ui = 'unite'
set splitbelow
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
set completeopt=longest,menuone,preview

" deoplete config
let g:deoplete#enable_at_startup = 1

"Super tab settings - uncomment the next 4 lines
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1


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
nmap <leader>bdd :bd!<CR>:echo "Buffer Murdered!!!"<CR>
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

" Denite mappings
nmap <leader>ubl :Denite buffer<CR>
nmap <leader>upf :DeniteProjectDir file_rec<CR>
nmap <leader>uml :Denite file_rec buffer<CR>

" Git mappings
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush
nmap <leader>gP :Gpull<CR>
nmap <leader>gl :GV<CR>
nmap <leader>gb :MerginalToggle<CR>

" Vim swoop config
let g:swoopUseDefaultKeyMap = 0
nmap <leader>ss :call Swoop()<CR>
vmap <leader>ss :call SwoopSelection()<CR>
nmap <leader>ssm :call SwoopMulti()<CR>
vmap <leader>ssm :call SwoopMultiSelection()<CR>


augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>mb :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap <leader>mgd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>mfi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>mft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>mfs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>mfu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>mfm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>mx  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>mfx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>mtt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>mdc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

    autocmd FileType cs nnoremap <leader>mrr :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <leader>mcf :OmniSharpCodeFormat<CR>
    autocmd FileType cs nnoremap <leader>mss :OmniSharpStartServer<cr>
    autocmd FileType cs nnoremap <leader>msp :OmniSharpStopServer<cr>

augroup END
