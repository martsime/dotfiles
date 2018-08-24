" Set compatible to Vim only.
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

call plug#begin('~/.config/nvim/plugged')

" Visual
Plug 'flazz/vim-colorschemes' " Colorschemes
Plug 'itchyny/lightline.vim' " Ligthline statusline

" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file searching
Plug 'junegunn/fzf.vim' " Asynchronous file/tag search
Plug 'francoiscabrol/ranger.vim' " Use ranger as a file explorer
Plug 'rbgrouleff/bclose.vim' " Dependency of ranger.vim

" Editing
Plug 'tpope/vim-commentary' " Changes to comment with 'gc'
Plug 'fooSoft/vim-argwrap' " Wrap function arguments with <leader>a
Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] } " Autoformat code with <leader>p

" Git
Plug 'airblade/vim-gitgutter' " Show git diff in number column
Plug 'jreybert/vimagit' " Modal git editing with <leader>g

call plug#end()

filetype plugin indent on


""" VISUAL

" Color highlighting
syntax enable

" Set background color
set background=dark

" Set colorscheme
colorscheme gruvbox

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


""" PERFORMANCE

" Fix slow scrolling caused by relative line numbers.
set lazyredraw


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


"" Ranger.vim
let g:ranger_map_keys = 0
map <leader>f :RangerWorkingDirectoryNewTab<CR>
map <leader>F :Ranger<CR>
let g:ranger_replace_netrw = 0


"" Argwrap
nnoremap <silent> <leader>a :ArgWrap<Cr>

" Use trailing comma on last argument
let g:argwrap_tail_comma = 1


