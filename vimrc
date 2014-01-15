" let's get this party started
execute pathogen#infect()

" plugin based indenting
filetype plugin indent on

" thanks again, Mr. Pope
color vividchalk

" syntax highlighting
syntax on

" pythonmode settings
let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint = 1
let g:pymode_lint_jump = 1
let g:pymode_lint_signs = 0
let g:pymode_lint_minheight = 5
let g:pymode_lint_maxheight = 12
" seriously... on by default?
let g:pymode_lint_write = 0

" ignore stuffs
set wildignore+=*.pyc,*.so,*.swp,*.swo     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let NERDTreeIgnore = ['\.pyc$','\.swp$','\.swo$']
 
"remember more!
set history=1000
set undodir=~/.vim/tmp
set undofile
set undolevels=1000
"eff tabs
set expandtab
"tabwidths - thanks Lokaltog
let g:tabwidth=4
exec 'set shiftwidth='  . g:tabwidth
exec 'set softtabstop=' . g:tabwidth
exec 'set tabstop='     . g:tabwidth
"complete like bash
set wildmode=longest:full
"another option
"set wildmode=list:longest
set wildmenu
" try to be Vim, not Vi
set nocompatible
" do not autowrite files when changing buffers
set noautowrite
" read saved buffers if new versions of the file show up
set autoread
" keep this many lines of context while scrolling
set scrolloff=4
" jump to words while searching
set incsearch
" line numbering on by default
set number
" allows unsaved buffers to background
set hidden
" 256 color
set t_Co=256
" highlight search stuff
set hlsearch
" backspace to EOL
set backspace=indent,eol,start
" status with only one buffer
set laststatus=2
" do not wrap text
set nowrap
" if you are going to break, use a 'breakat' char
set linebreak
" don't break my code, please
set textwidth=0
set wrapmargin=0

" pretty!
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
autocmd Syntax * RainbowParenthesesLoadChevrons

" Start nerdtree on vim w/ args
"autocmd vimenter * NERDTree
" Start nerdtree on vim w/o args
"autocmd vimenter * if !argc() | NERDTree | endif
" Kill nerdtree when upon opening a file
let NERDTreeQuitOnOpen = 1

" Kills mini-window (f(n) def) from auto-complete
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Ordered by keyboard layout
nnoremap <Leader>1 :tabp<CR>
nnoremap <Leader>2 :tabn<CR>
nnoremap <Leader>3 :tabnew<CR>
nnoremap <Leader># :tabclose<CR>

nnoremap <Leader>q :bprevious<CR>
nnoremap <Leader>w :bnext<CR>
nnoremap <Leader>e :enew<CR>
nnoremap <Leader>E :Bclose<CR>
" <Leader>t = tasklist
nnoremap <Leader>T :Tagbar<CR>
" <Leader>r = run
nnoremap <Leader>p :CtrlPTag<CR>
nnoremap <Leader>P :CtrlPMixed<CR>
nnoremap <Leader>[ :RainbowParenthesesToggle<CR>
nnoremap <Leader>] :PyLint<CR>

nnoremap <Leader>a :NERDTreeToggle<CR>
nnoremap <Leader>s :MRU<CR>
nnoremap <Leader>d :e .<CR>
nnoremap <Leader>D :bd!<CR>
nnoremap <Leader>f :color unkiwii<CR>
nnoremap <Leader>F :color railscasts<CR>
nnoremap <Leader>g :Gstatus<CR>
nnoremap <Leader>G :Gcommit<CR>
nnoremap <Leader>h :Glog<CR>
nnoremap <Leader>H :Gblame<CR>

nnoremap <Leader>z :write !diff % -<CR>
nnoremap <Leader>x :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>c :let @/ = ""<CR>
nnoremap <Leader>C :SCROLLCOLOR<CR>
nnoremap <Leader>v :set paste!<CR>
nnoremap <Leader>V :so ~/.vimrc<CR>
" <Leader>b = breakpoint
nnoremap <Leader>N :set number!<CR>

" save my right pinky
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
