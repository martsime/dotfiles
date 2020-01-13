" Set compatible to Vim only.
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

call plug#begin('~/.config/nvim/plugged')

" Visual
Plug 'flazz/vim-colorschemes' " Colorschemes
Plug 'itchyny/lightline.vim' " Ligthline statusline
Plug 'w0rp/ale' " Asynchronous lint engine
Plug 'sheerun/vim-polyglot'  " Syntax highlighting for many languages
Plug 'rust-lang/rust.vim' " Syntax highlighting and formatting for Rust
Plug 'jalvesaq/nvim-r' " Plugin for R lang

" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file searching
Plug 'junegunn/fzf.vim' " Asynchronous file/tag search
Plug 'francoiscabrol/ranger.vim' " Use ranger as a file explorer
Plug 'rbgrouleff/bclose.vim' " Dependency of ranger.vim
Plug 'christoomey/vim-tmux-navigator' " Navigate between tmux and vim with <C>+hjkl
Plug 'airblade/vim-rooter'  " Opens vim from git root

" Editing
Plug 'tpope/vim-commentary' " Changes to comment with 'gc'
Plug 'fooSoft/vim-argwrap' " Wrap function arguments with <leader>a
Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] } " Autoformat code with <leader>p

" Git
Plug 'airblade/vim-gitgutter' " Show git diff in number column
Plug 'jreybert/vimagit' " Modal git editing with <leader>g

" Auto-completion
Plug 'ludovicchabant/vim-gutentags' " Automatically create ctag files
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion framework 

" Language Server Protocol
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh' }

call plug#end()

filetype plugin indent on


""" VISUAL

" Color highlighting
syntax enable

" Set background color
set background=dark

" Set colorscheme
colorscheme gruvbox

" Remove background
hi! Normal ctermbg=NONE guibg=None

" Show line numbers
set number

" Start scrolling when X lines from end of screen
set scrolloff=10


""" BEHAVIOUR

" Increase the undo limit
set history=1000

" Turn of swap file in vim
set noswapfile

" Open new splits to the right and below (feels more natrual)
set splitright
set splitbelow


""" SEARCHING

" Ignore case when searching
set ignorecase

" Except when using capital letters
set smartcase


""" FORMATTING

" One tab in a file is shown as X spaces
set tabstop=4

" One tab inserts X spaces
set softtabstop=4

" One tab equals X spaces
set shiftwidth=4

" Tab is replaced by spaces specified as above
set expandtab

" Smartwrapping of overflowing text is indented correctly
set breakindent

" Indent size for different file types
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype c setlocal ts=2 sw=2 sts=0 expandtab


""" KEYBINDINGS

" <leader> is set to space
let mapleader=" "

" Deactivate the arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Clear search highlighting
nnoremap <Esc><Esc> :noh<CR>

" Remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap open vertical split
nnoremap <silent> <leader>v :vsp<CR>

" System clipboard
nmap <leader>y "+y
vmap <leader>y "+y


""" PERFORMANCE

" Fix slow scrolling caused by relative line numbers.
set lazyredraw


""" PYTHON
" Python paths for current python project. Used by Jedi-vim
let g:python_host_prog = $HOME.'/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.virtualenvs/neovim3/bin/python'


""" PLUGINS

"" Vimagit
nnoremap <leader>gg :Magit<CR>
nnoremap <leader>gp :! git push<CR>


"" Fsf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit' }

" All files in project
nnoremap <silent> <leader><space> :Files<CR>

" All tags in project
nnoremap <silent> <leader>t :Tags<CR>

" Grep content of all files
nnoremap <silent> <leader>/ :Find<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


"" Ranger.vim
let g:ranger_map_keys = 0
map <leader>f :RangerWorkingDirectoryNewTab<CR>
map <leader>F :Ranger<CR>
let g:ranger_replace_netrw = 0


"" Argwrap
nnoremap <silent> <leader>a :ArgWrap<Cr>

" Use trailing comma on last argument
let g:argwrap_tail_comma = 1

" Rust
let g:rustfmt_autosave = 1


"" Ale
let g:ale_fixers = {
    \ 'javascript': ['eslint'], }


"" Deoplete
let g:deoplete#enable_at_startup = 1


"" Gutentags
let g:gutentags_file_list_command = 'rg --files'


"" Gitgutter

" Remaps
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)

" Update sign in column every 200 ms
set updatetime=200

"" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ 'html': ['html-languageserver', '--stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'python' : ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'sh': ['bash-language-server', 'start']
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Show documentation for method
nnoremap <silent> <Leader>K :call LanguageClient_textDocument_hover()<CR>

" Go to definition
nnoremap <silent> <Leader>d :call LanguageClient_textDocument_definition()<CR>

" Show short type and doc information
nnoremap <silent> <Leader>D :call LanguageClient_textDocument_hover()<CR>

" Rename identifier
nnoremap <silent> <Leader>r :call LanguageClient_textDocument_rename()<CR>

" Search symbols in current buffer
nnoremap <silent> <Leader>s :call LanguageClient_textDocument_documentSymbol()<CR>

" Show a list of all references to identifier under cursor
" Does not seem to work for python-language-server
nnoremap <silent> <Leader>R :call LanguageClient_textDocument_references()<CR>

" Format the entire buffer
" nnoremap <silent> <Leader>F :call LanguageClient_textDocument_formatting()<CR>

" Use LanguageClient for gq formatting
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
