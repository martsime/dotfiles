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
Plug 'neomake/neomake', {'for': ['latex', 'tex', 'plaintex']} " Linting for latex documents

" R-lang
Plug 'jalvesaq/nvim-r' " Plugin for R lang
Plug 'vim-pandoc/vim-pandoc'    " Integration with the pandoc document converter
Plug 'vim-pandoc/vim-pandoc-syntax'  " Syntax for pandoc supported filetypes

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
Plug 'lervag/vimtex'  " LaTeX completion
Plug 'ludovicchabant/vim-gutentags' " Automatically create ctag files
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion framework 

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

" Highlight current line
set cursorline

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

"" Pandoc
" Disable folding of sections and automatic directory change
let g:pandoc#modules#disabled = ["folding", "chdir"]

"" Nvim-r
" Enable the use of library(colorout) for colorized R terminals
let R_in_buffer = 1

" R output is highlighted with current colorscheme
let g:rout_follow_colorscheme = 1

" R commands in R output are highlighted
let g:Rout_more_colors = 1

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

"""" vimtex
" Start vim client server for backwards search from PDF file
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 0,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \ ],
    \}

" Disable custom warnings based on regexp
let g:vimtex_quickfix_ignore_filters = [
      \ 'Font shape declaration',
      \]

" Program used to preview output pdf
let g:vimtex_view_method = 'zathura'

" Flavor of tex to use
let g:tex_flavor = "tex"

"""" Coc.nvim
" Extensions need to be installed at first startup
" :CocInstall coc-python coc-rust-analyzer coc-snippets coc-git coc-html coc-css coc-highlight coc-vimlsp

" Tweak insert mode completion
"   noinsert: Do not insert text before accepting the completion
"   menuone: Use the popup menu even if there is only one match
"   noselect: Do not select a match in the menu, force manual selection
set completeopt=noinsert,menuone,noselect

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
