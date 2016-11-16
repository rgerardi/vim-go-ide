"============================================================================
" Enable Pathogen (Easy plugin manager)
"============================================================================
execute pathogen#infect()

"============================================================================
" General options
"============================================================================
" Color molokai
colo molokai

" Syntax highlight on
syntax on

" Filetype identification on
filetype plugin indent on

" Line numbers on by default
set number

" Set cursorline
set cursorline

"============================================================================
" Set up persistent undo (with all undo files in one directory)
"============================================================================
if has('persistent_undo')
   set undofile
endif

set undodir=$HOME/.VIM_UNDO_FILES

set undolevels=5000


"============================================================================
" When completing, show all options, insert common prefix, then iterate
"============================================================================
set wildmode=list:longest,full

"============================================================================
" Enabling some cool search options
"============================================================================
"Incremental search
set incsearch
"Highlight search
set hlsearch
"Remap search key to allow Perl like regular expression search with \v directly
nnoremap / /\v
"Setting ignore case and smart case
set ignorecase smartcase
" Make delete key in Normal mode remove the persistently highlighted matches
nmap <silent>  <BS>  :nohlsearch<CR>

"============================================================================
" Status bar
"============================================================================
" Show the status bar all the time
set laststatus=2

"Enable tabs on airline status
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

"============================================================================
" Useful plugins
"============================================================================
" Enable neocomplete by default (for vim7)
"let g:neocomplete#enable_at_startup = 1

" Map Tagbar to F9
nnoremap <silent> <F9> :TagbarToggle<CR>

"## For Ctrl-P extension
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"============================================================================
" Options for vim-go and Golang programming in general
"============================================================================
" Line numbers on by default for Go files
"autocmd BufNewFile,BufRead *.go set number

" Set tabs in go to equivalent of 4 spaces (instead of 8)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" GoImports will run on Save
let g:go_fmt_command="goimports"

" Common Go commands
au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>a <Plug>(go-alternate-edit)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" Enabling GoMetaLinter on save
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

"============================================================================
" Enable neosnippet
"============================================================================
let g:go_snippet_engine = "neosnippet"
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?  
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"============================================================================
" numbers plugin
"============================================================================
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

"============================================================================
" NERDTree plugin
"============================================================================
map <F5> :NERDTreeToggle<CR>
