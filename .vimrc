" Use ~x on an English Windows version or ~n for French.
if has("win32")
  au GUIEnter * simalt ~x
endif

if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')

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
    Plug 'Shougo/neocomplete.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'majutsushi/tagbar'
    Plug 'easymotion/vim-easymotion'
    Plug 'morhetz/gruvbox'

    " Omnisharp custom build func
    function! BuildOmniSharp()
        "!cd ~/.vim/plugged/omnisharp-vim/server && xbuild
        "!cd ~/.vim/plugged/omnisharp-vim/omnisharp-roslyn && ./build.sh
    endfunction
    Plug 'omnisharp/omnisharp-vim', {'do': BuildOmniSharp()}
    Plug 'OrangeT/vim-csharp'

call plug#end()


" **********************************
" General configs goes here!!
filetype plugin indent on
syntax enable
set guifont=Hack\ 10"
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

<<<<<<< Updated upstream
=======
"set autochdir

>>>>>>> Stashed changes
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

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch
"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone
"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow
" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic']
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
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

augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2
" Enable snippet completion, requires completeopt-=preview
let g:OmniSharp_want_snippet=1

" Neocomplete config
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

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
nmap <leader>ma :OmniSharpGetCodeActions<CR>
vmap <leader>ma :call OmniSharp#GetCodeActions('visual')<CR>
nmap <leader>mr :OmniSharpRename<CR>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
nmap <leader>mrl :OmniSharpReloadSolution<CR>
nmap <leader>mcf :OmniSharpCodeFormat<CR>
nmap <leader>mss :OmniSharpStartServer<CR>
nmap <leader>msp :OmniSharpStopServer<CR>
