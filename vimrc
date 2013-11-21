execute pathogen#infect()

filetype plugin indent on

color vividchalk

syntax on

let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint_write = 0
let g:pymode_lint = 1
let g:pymode_lint_jump = 1
let g:pymode_lint_signs = 0
let g:pymode_lint_minheight = 5
let g:pymode_lint_maxheight = 5

set wrap
set linebreak
set number
set hidden
set t_Co=256
set hlsearch
set backspace=indent,eol,start

RainbowParenthesesLoadBraces
RainbowParenthesesLoadChevrons
RainbowParenthesesLoadRound
RainbowParenthesesLoadSquare
RainbowParenthesesLoadBraces
RainbowParenthesesToggle

"Start nerdtree on vim w/ args
"autocmd vimenter * NERDTree
"Start nerdtree on vim w/o args
"autocmd vimenter * if !argc() | NERDTree | endif
"Kills mini-window from auto-complete
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"Ordered by keyboard layout
nnoremap <Leader>1 :tabp<CR>
nnoremap <Leader>2 :tabn<CR>
nnoremap <Leader>3 :tabnew<CR>
nnoremap <Leader># :tabclose<CR>

nnoremap <Leader>q :bprevious<CR>
nnoremap <Leader>w :bnext<CR>
nnoremap <Leader>e :enew<CR>
nnoremap <Leader>E :bd!<CR>
"<Leader>t = tasklist
nnoremap <Leader>T :Tagbar<CR>
"<Leader>r = run
nnoremap <Leader>] :PyLint<CR>

nnoremap <Leader>a :NERDTreeToggle<CR>
nnoremap <Leader>s :MRU<CR>
nnoremap <Leader>d :e .<CR>
nnoremap <Leader>D :bd!<CR>
nnoremap <Leader>f :color unkiwii<CR>
nnoremap <Leader>F :color railscasts<CR>

nnoremap <Leader>x :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>c :let @/ = ""<CR>
nnoremap <Leader>C :SCROLLCOLOR<CR>
nnoremap <Leader>v :set paste!<CR>
nnoremap <Leader>V :so ~/.vimrc<CR>
"<Leader>b = breakpoint
nnoremap <Leader>N :set number!<CR>

"Save my right pinky
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
