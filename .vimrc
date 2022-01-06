" Use ~x on an English Windows version or ~n for French.
if has("win32")
  au GUIEnter * simalt ~x
endif

if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')

    Plug 'mhinz/vim-startify'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    Plug 'airblade/vim-gitgutter'
    Plug 'Raimondi/delimitMate'
    Plug 'sheerun/vim-polyglot'
    Plug 'pelodelfuego/vim-swoop'
    Plug 'junegunn/gv.vim'
    Plug 'mbbill/undotree'
    Plug 'shougo/vimproc.vim', {'do': 'make'}
    Plug 'tpope/vim-dispatch'
    Plug 'SirVer/ultisnips'
    Plug 'majutsushi/tagbar'
    Plug 'easymotion/vim-easymotion'
    Plug 'morhetz/gruvbox'
    Plug 'honza/vim-snippets'

    Plug 'omnisharp/omnisharp-vim', { 'do': 'cd server && xbuild' }
    Plug 'OrangeT/vim-csharp'
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    Plug 'dimixar/deoplete-omnisharp'
    Plug 'ervandew/supertab'
    Plug 'idanarye/vim-merginal'
    Plug 'randomize/switch.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    Plug 'hoelzro/vim-split-navigate'
    Plug 'ryanoasis/vim-devicons'
    Plug 'w0rp/ale'
    Plug 'zchee/deoplete-jedi'

    Plug 'simeji/winresizer'
    Plug 'hecal3/vim-leader-guide'

call plug#end()


" **********************************
" General configs goes here!!
filetype plugin indent on
syntax enable
set termguicolors
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
set listchars=tab:>·,trail:•
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
set ignorecase

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

" Ale config
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'


" Split navigate config
let g:splitnavigate_start_key = "<leader><leader><leader>"
"default white on blue
highlight default TopHighlight term=bold ctermfg=252 ctermbg=18 guifg=fg guibg=#000080
" default yellow on red
highlight default BottomHighlight term=standout ctermfg=186 ctermbg=88 guifg=#d0d090 guibg=#800000

" airline config
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

"let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_c = 'WN: %{winnr()}'
let g:airline_section_y = 'BN: %{bufnr("%")} %{&encoding}'
let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
"endif

"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

"" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

"Switch config
let g:switch_mapping = ""
let g:switch_find_fallback_match_cursor_right = 1
let g:switch_find_fallback_match_line_start = 1

autocmd FileType cs let b:switch_custom_definitions =
    \ [
    \   [  '+=' , '-='  ],
    \   [  'private' , 'public', 'protected'  ],
    \   [  'struct' , 'class'  ],
    \   [  'OnDisable()' , 'OnEnable()' ],
    \   [  'Update()' , 'FixedUpdate()' ],
    \   [  'Debug.Log(' , 'Debug.LogFormat('],
    \   [  'Debug.LogError(', 'Debug.LogErrorFormat(' ],
    \   [  'Debug.LogWarning(', 'Debug.LogWarningFormat(' ]
    \ ]
"

" Undotree config
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" OmniSharp config
"let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_want_snippet=1
set splitbelow
set completeopt=longest,menuone

" deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_menu_width = 1000
let g:deoplete#auto_complete_start_length = 1
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
autocmd CompleteDone * pclose!

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

" leader guide config
let g:lmap =  {}
call leaderGuide#register_prefix_descriptions(' ', "g:lmap")

" ********************************
" All mappings start here
let mapleader = ' '

"leader guide startup
nnoremap <silent> <leader> :LeaderGuide ' '<CR>
vnoremap <silent> <leader> :LeaderGuideVisual ' '<CR>
"nnoremap <silent> <leader> :LeaderGuideD g:lmap<CR>

" Easy copy/paste to/from system clipboard
let g:lmap.p = ['\"+p', 'Paste from system clipboard']
nnoremap <silent> <leader>p "+p
vnoremap <silent> <leader>y "+y
let g:lmap.y = ['\"+y', 'Copy to system clipboard']


" Folding shortcuts
" Toggle fold
nmap <silent> <leader>eft za
" Open All folds
nmap <silent> <leader>efO zR
" Close all folds
nmap <silent> <leader>efC zM

let g:lmap.e = {'name' : 'Extras'}
let g:lmap.e.f = {'name' : 'Folds'}
let g:lmap.e.f.t = ['za', 'Toggle fold']
let g:lmap.e.f.O = ['zR', 'Open all folds']
let g:lmap.e.f.C = ['zM', 'Close all folds']

" file shortcuts (like spacemacs)
nmap <silent> <leader>fs :w<CR>:echo "saved file!!!"<CR>

let g:lmap.f = {'name': 'Files'}
let g:lmap.f.s = ['w', 'Save current file']

" buffer shortcuts
nmap <silent> <leader>bd :bd<CR>:echo "Buffer Killed!!!"<CR>
nmap <silent> <leader>bdd :bd!<CR>:echo "Buffer Murdered!!!"<CR>
" startify buffer shortcut
nmap <silent> <leader>bs :Startify<CR>

let g:lmap.b = {'name': 'Buffer'}
let g:lmap.b.d = ['bd', 'Delete buffer']
let g:lmap.b.D = ['bd!', 'Delete buffer forced']
let g:lmap.b.s = ['Startify', 'Go to Startify']

" window shortcuts
nmap <silent> <leader>wj <C-w>j
nmap <silent> <leader>wk <C-w>k
nmap <silent> <leader>wh <C-w>h
nmap <silent> <leader>wl <C-w>l
nmap <silent> <leader>wJ <C-w>J
nmap <silent> <leader>wK <C-w>K
nmap <silent> <leader>wH <C-w>H
nmap <silent> <leader>wL <C-w>L
nmap <silent> <leader>wv <C-w>v
nmap <silent> <leader>ws <C-w>s
nmap <silent> <leader>wd :hide<CR>
nmap <silent> <leader>wtt :NERDTreeToggle<CR>
nmap <silent> <leader>wtc :TagbarToggle<CR>
nmap <silent> <leader>wu :UndotreeToggle<CR>
nmap <silent> <leader>wn <C-w>w
nmap <silent> <leader>qq :qa<CR>
nmap <silent> <leader>qQ :qa!<CR>

let g:lmap.w = {'name': 'Window'}
let g:lmap.w.j = ['<C-w>j', 'Go down']
let g:lmap.w.k = ['<C-w>k', 'Go up']
let g:lmap.w.h = ['<C-w>h', 'Go left']
let g:lmap.w.l = ['<C-w>l', 'Go right']
let g:lmap.w.J = ['<C-w>J', 'Go lowest']
let g:lmap.w.K = ['<C-w>K', 'Go highest']
let g:lmap.w.H = ['<C-w>H', 'Go left most']
let g:lmap.w.L = ['<C-w>L', 'Go right most']
let g:lmap.w.v = ['<C-w>v', 'Split vertical']
let g:lmap.w.s = ['<C-w>s', 'Split horizontal']
let g:lmap.w.d = ['hide', 'Destroy window']
let g:lmap.w.t = {'name': 'Toggles'}
let g:lmap.w.t.t = ['NERDTreeToggle', 'NERDTree']
let g:lmap.w.t.c = ['TagbarToggle', 'Tagbar']
let g:lmap.w.t.u = ['UndotreeToggle', 'Undotree']
let g:lmap.w.n = ['<C-w>w', 'Move to window number']
let g:lmap.q = {'name': 'Quit vim'}
let g:lmap.q.q = ['qa', 'Normal']
let g:lmap.q.Q = ['qa!', 'Forced']

" fzf mappings
nmap <leader>uff :GFiles<CR>
nmap <leader>ufb :Buffers<CR>
nmap <leader>ufw :Windows<CR>
nmap <leader>ufo :BTags<CR>
nmap <leader>uft :Tags<CR>
nmap <leader>ufl :BLines<CR>
nmap <leader>ufs :Snippets<CR>

let g:lmap.u = {'name': 'Unified search'}
let g:lmap.u.f = {'name': 'fzf'}
let g:lmap.u.f.f = ['GFiles', 'Search files']
let g:lmap.u.f.b = ['Buffers', 'Search buffers']
let g:lmap.u.f.w = ['Windows', 'Search windows']
let g:lmap.u.f.o = ['BTags', 'Search buffer tags']
let g:lmap.u.f.t = ['Tags', 'Search project tags']
let g:lmap.u.f.l = ['BLines', 'Search buffer lines']
let g:lmap.u.f.s = ['Snippets', 'Search Snippets']


" Git mappings
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush
nmap <leader>gP :Gpull<CR>
nmap <leader>gl :GV<CR>
nmap <leader>gb :MerginalToggle<CR>

let g:lmap.g = {'name': 'Git'}
let g:lmap.g.s = ['Gstatus', 'Status']
let g:lmap.g.c = ['Gcommit', 'Commit']
let g:lmap.g.p = ['Gpush', 'Push']
let g:lmap.g.P = ['Gpull', 'Pull']
let g:lmap.g.l = ['GV', 'Log Tree']
let g:lmap.g.b = ['MerginalToggle', 'Merginal toggle']

" Vim swoop config
let g:swoopUseDefaultKeyMap = 0
nmap <leader>ss :call Swoop()<CR>
vmap <leader>ss :call SwoopSelection()<CR>
nmap <leader>sS :call SwoopMulti()<CR>
vmap <leader>sS :call SwoopMultiSelection()<CR>

let g:lmap.s = {'name': 'Swoop'}
let g:lmap.s.s = ['call Swoop()', 'Current buffer']
let g:lmap.s.S = ['call SwoopMulti()', 'All buffers']


" Omnisharp mappings
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    "autocmd BufEnter,TextChanged,InsertLeave *.cs Neomake

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap <leader>mb :wa!<cr>:OmniSharpBuildAsync<cr>
    autocmd FileType cs nnoremap <leader>mg :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>mt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>mr :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <leader>mc :OmniSharpCodeFormat<CR>
    autocmd FileType cs nnoremap <leader>md :OmniSharpDocumentation<cr>
    autocmd FileType cs nnoremap <leader>mfi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>mft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>mfs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>mfu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap <leader>mfm :OmniSharpFindMembers<cr>
    autocmd FileType cs nnoremap <leader>mss :OmniSharpStartServer<cr>
    autocmd FileType cs nnoremap <leader>msp :OmniSharpStopServer<cr>
    autocmd FileType cs nnoremap <leader>mxi  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>mxu :OmniSharpFixUsings<cr>

    let g:mmap = {'name': 'OmniSharp'}
    let g:mmap.b = ['OmniSharpBuildAsync', 'Build']
    let g:mmap.g = ['OmniSharpGotoDefinition', 'Go to definition']
    let g:mmap.t = ['OmniSharpTypeLookup', 'Lookup type']
    let g:mmap.r = ['OmniSharpRename', 'Rename']
    let g:mmap.c = ['OmniSharpCodeFormat', 'Code format']
    let g:mmap.d = ['OmniSharpDocumentation', 'Documentation']
    let g:mmap.f = {'name': 'Find'}
    let g:mmap.f.i = ['OmniSharpFindImplementations', 'Implementation']
    let g:mmap.f.t = ['OmniSharpFindType', 'Type']
    let g:mmap.f.s = ['OmniSharpFindSymbol', 'Symbol']
    let g:mmap.f.u = ['OmniSharpFindUsages', 'Usages']
    let g:mmap.f.m = ['OmniSharpFindMembers', 'Members']
    let g:mmap.s = {'name': 'Server'}
    let g:mmap.s.s = [':OmniSharpStartServer', 'Start']
    let g:mmap.s.p = [':OmniSharpStopServer', 'Stop']
    let g:mmap.x = {'name': 'Fix'}
    let g:mmap.x.i = [':OmniSharpFixIssue', 'Issue']
    let g:mmap.x.u = [':OmniSharpFixUsings', 'Usings']

    autocmd FileType cs let g:lmap['m'] = g:mmap

    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>


augroup END

" Switch mapping
nmap <leader>sw :Switch<CR>

let g:lmap.s.w = ['Switch', 'Switch key-words']

"Ultisnips mappings
let g:UltiSnipsExpandTrigger="<c-x><c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"winresizer mapping
let g:winresizer_start_key = '<leader>wr'
