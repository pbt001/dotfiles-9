"----------------------
" Plugins
"----------------------
call plug#begin('~/.local/share/nvim/plugged')

" Git bits
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Buffer Navigation
Plug 'troydm/easybuffer.vim'

" Wizard autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
" Emoji autocompletion for commit messages and markdown
Plug 'fszymanski/deoplete-emoji'

" make tab do all
Plug 'ervandew/supertab'

" text snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" less keystrokes
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" Linty lint
Plug 'w0rp/ale'

" Text swizzeling
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" JS + Html unmangeling
Plug 'maksimr/vim-jsbeautify'

" Javascript
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug '1995eaton/vim-better-javascript-completion', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }
Plug 'joukevandermaas/vim-ember-hbs'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Other Languages
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'tpope/vim-rails'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'joukevandermaas/vim-ember-hbs'

" junegunn 🙏
" see contents of registers real quick
Plug 'junegunn/vim-peekaboo'
" fuzzy file search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" tranquil poetry mode
Plug 'junegunn/goyo.vim'
" emoji, the blood of life
Plug 'junegunn/vim-emoji'

" pretty colours
Plug 'chriskempson/base16-vim'

" Directory exploration
Plug 'justinmk/vim-dirvish'

" Status Bar + Buffer Bar
Plug 'vim-airline/vim-airline'
" Plug '22a/vim-airline-themes'
Plug 'vim-airline/vim-airline-themes'

" visual indentation levels
Plug 'nathanaelkane/vim-indent-guides'

" Seeing whitespace is fun
Plug 'ntpeters/vim-better-whitespace'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

" numbered search matches
Plug 'henrik/vim-indexed-search'

" editor config
Plug 'editorconfig/editorconfig-vim'

call plug#end()


"----------------------
" General Wizardry
"----------------------
filetype off
syntax on

" no folding please
set nofoldenable


" better % skulduggery
runtime macros/matchit.vim

" Only highlight the first 120 columns, no more minified spookery
set synmaxcol=256

set mouse=a

autocmd! bufreadpost *.min.* syntax off

" spelling is hard
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" command line bits
set showcmd
set wildmenu
set wildmode=longest:list
set wildignorecase

" backspace everything
set backspace=indent,eol,start

" gutter
set relativenumber
set number

" cursor
set cursorline

" files
set nobackup
set noswapfile
set nowritebackup

" tabs, etc
set expandtab " spaces, not tabs !!!
set autoindent " have a go at auto indenting even when no filetype set
set tabstop=2 " represent tabs as 2 spaces
set shiftwidth=2  " tab key enters two spaces"
set softtabstop=2 " backspace deletes two spaces
" set smarttab

" / searching
set hlsearch " highlight matches
set incsearch " incrementally show matches as we type
set ignorecase
set smartcase " if we've explicitly typed an uppercase, become case sensitive

" 0 delay between keys
set timeoutlen=1000 ttimeoutlen=0

" disable all bells
set vb t_vb=
set noerrorbells

" scroll padding
set scrolloff=15
set sidescrolloff=15

" sane vim split directions
set splitright
set splitbelow

" incremental command result display
" (show the result of :%s/foo/bar/g as we type it)
set inccommand=nosplit

" Default peekaboo window
let g:peekaboo_window = 'vertical botright 30new'

let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['viml=vim', 'bash=sh']


"----------------------
" Autocomplete
"----------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions= {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

set completeopt=longest,menuone,preview
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" make supertab close the tern preview
let g:SuperTabClosePreviewOnPopupClose = 1
" make supertab move down instead of up
let g:SuperTabDefaultCompletionType = "<c-n>"

" spelling is nice too
set complete+=kspell

" C-x, C-u emoji completion :dog:
set completefunc=emoji#complete


"----------------------
" Snippets
"----------------------

" Snippet expansion
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

let g:jsdoc_allow_input_prompt = 1


"----------------------
" Linting
"----------------------
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_fixers = { 'javascript': ['prettier'] }
" Format on Save
let g:ale_fix_on_save = 1
" Respect local Prettier config files
let g:ale_javascript_prettier_use_local_config = 1

"----------------------
" Key Bindings
"----------------------
" disable arrow keys in insert, normal, and visual mode
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Ctrl-P for fzf
nnoremap <C-p> :FZF<CR>

" hide fzf status bar (it only says \"FZF")
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" disable EX mode
nnoremap Q <NOP>

" easier split nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" disable search highlighting with escape
noremap <silent> <Esc> :noh<CR><Esc>

" swap 0 and ^. 0 now goes to the first non-blank character of a line
noremap 0 ^
" in case you need to go to the very beginning of a line, make that ^
noremap ^ 0

" pls let me leave terminal :'(
tnoremap <Esc> <C-\><C-n>

" make the cursor play nice with wrapped lines
noremap <silent> k gk
noremap <silent> j gj

"----------------------
" Commands
"----------------------

" fingers are difficult, make all typos work
command! Wq wq
command! WQ wq
command! W w
command! Q q

" :wsudo to save files if we've accidentally opened them read only
command! Wsudo w !sudo tee %

" beautify things quickly
command! Jsbeautify call JsBeautify()
command! Jsonbeautify call JsonBeautify()
command! Htmlbeautify call HtmlBeautify()
command! Cssbeautify call CSSBeautify()

"----------------------
" Leader Commands
"----------------------

" civ4 victory by space-race
" (use space key as leader)
let mapleader = "\<Space>"

" Easily reload vimrc
nnoremap <Leader>R :so ~/.config/nvim/init.vim<CR>
" Easily manage plugins
nnoremap <Leader>PI :PlugInstall<CR>
nnoremap <Leader>PU :PlugUpdate<CR>
nnoremap <Leader>PC :PlugClean<CR>

" sneaky snake to camel case
nnoremap <Leader>s :s#_\(\l\)#\u\1#g<CR>

" Trim Leading WS
nnoremap <Leader>tw :call TrimWhitespace()<CR>

" fast file rename
nnoremap <Leader>rf :call RenameFile()<cr>

" fast edit nvim rc
nnoremap <Leader>rc :e ~/.config/nvim/init.vim<CR>

" ye, system clip pls
set clipboard=unnamed

" yank to system clipboard without motion
nnoremap <Leader>y "+y
" yank line to system clipboard
nnoremap <Leader>yl "+yy
" yank file to system clipboard
nnoremap <Leader>yf gg"+yG
" paste from system clipboard
nnoremap <Leader>p "+p

" Toggle cases
nnoremap <Leader>t g~
nnoremap <Leader>tc ~h
nnoremap <Leader>tW g~iw
nnoremap <Leader>tl g~~

" writing files is too slow
nnoremap <Leader>w :w<CR>

" closing buffers is too slow
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>C :bd!<CR>

" closing everything is too slow
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" grepping
" open a fullscreen interactive grepping window
nnoremap <leader>g :Rg!<CR>
" open a small interactive grepping window
nnoremap <leader>G :Rg<CR>
" grep the current working dir for the current word under the cursor
nnoremap <leader>* :Rg <c-r>=expand("<cword>")<CR><CR>

" make :Rg! show a preview of the file
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" easy toggle wrap, spell, and paste
nnoremap <Leader>W :set wrap!<CR>
nnoremap <Leader>S :set spell!<CR>
nnoremap <Leader>P :set paste!<CR>
" easily toggle ALE fixing on write
nnoremap <Leader>F :call ToggleAleFixer()<CR>

"----------------------
" Colour :art:
"----------------------

" true colours awwww yeeee
set termguicolors
colorscheme base16-spacemacs

" show superfluous whitespace in white
highlight ExtraWhitespace guibg=white

" mart the 80th char on a line
" (because 80 is a number that people care about)
set colorcolumn=80

" indent guide colors
let g:indent_guides_auto_colors = 0
" base16 bg is #1F2022, so i've just bumped up to #222426 and #242628
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#242628
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222426

" react jsx highlighting
let g:jsx_ext_required = 0

"----------------------
" Buffers
"----------------------

" hop from file to file without saving
set hidden

" cycle through buffers
map <Leader><tab> :bn<CR>
map <Leader>` :bp<CR>
map ` :EasyBuffer<CR>


"----------------------
" Status Bar
"----------------------
set noshowmode " don't show the plain mode text (we use airline)
set laststatus=2
let g:airline_theme='base16_spacemacs'
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" let g:webdevicons_enable_airline_tabline = 1
" let g:webdevicons_enable_airline_statusline = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''


"----------------------
" Helpful Functions
"----------------------
function! ToggleAleFixer()
  let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1
endfunc

function! TrimWhitespace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunc

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
