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
"let g:pymode_lint_write = 0
" seriously... renamed so it's back? uggg
let g:pymode_lint_on_write = 0

" ignore stuffs
" i'll ditch GAE after this project
set wildignore+=.git,.hg,.svn,*.pyc,*.so,*.swp,*.swo,google_appengine
" CtrlP is nice enough to honor wildignore... unlike some plugins. >:|
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let NERDTreeIgnore = ['\.pyc$','\.swp$','\.swo$','google_appengine']

" gitgutter bar by default
let g:gitgutter_highlight_lines = 0
let g:gitgutter_sign_column_always = 1
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '@@'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified_removed = '@-'
augroup DeGraySigns
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    "autocmd VimEnter * :highlight SignColumn ctermbg=Blue
augroup END

let g:tagbar_width = 38
"augroup TagbarEnter
"    autocmd!
"    autocmd VimEnter * nested :call tagbar#autoopen(1)
"augroup END
 
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
set foldcolumn=0

" pretty!
augroup RainbowPoop
    autocmd!
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
    autocmd Syntax * RainbowParenthesesLoadChevrons
augroup END

" Start nerdtree on vim w/ args
"autocmd vimenter * NERDTree
" Start nerdtree on vim w/o args
"autocmd vimenter * if !argc() | NERDTree | endif
" Kill nerdtree when upon opening a file
let NERDTreeQuitOnOpen = 1

" Kills mini-window (f(n) def) from auto-complete
augroup EffOffWinder
    autocmd!
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END

" some custom functions for copypasta all quick like... emhmm
function! CopyToggle() range
    " this dude just toggles numbered lines and the SignColumn
    set number!
    GitGutterToggle
endfunction

function! PasteReady() range
    " this dude turns on paste mode, puts you in insert mode
    " then autocmds the cleanup
    set paste
    startinsert
    augroup PasteHelper
        autocmd InsertLeave * call PasteUnready()
    augroup END
endfunction

function! PasteUnready() range
    " this dude does the cleanup by turning off paste mode
    " and unbinding itself from InsertLeave
    set paste!
    augroup PasteHelper
        autocmd!
    augroup END
endfunction

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
nnoremap <Leader>T :TagbarToggle<CR>
" <Leader>r = run
nnoremap <Leader>R :edit!<CR>
nnoremap <Leader>p :CtrlPTag<CR>
nnoremap <Leader>P :CtrlPMixed<CR>
nnoremap <Leader>[ :RainbowParenthesesToggle<CR>
nnoremap <Leader>] :PymodeLint<CR>
nnoremap <Leader>} :PymodeLintAuto<CR>

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
nnoremap <Leader>v :call PasteReady()<CR>
nnoremap <Leader>V :so ~/.vimrc<CR>
" <Leader>b = breakpoint
nnoremap <Leader>N :call CopyToggle()<CR>

" save my right pinky
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
