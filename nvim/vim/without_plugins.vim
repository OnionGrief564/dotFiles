set nocompatible

filetype plugin indent on
set encoding=UTF-8
set nowrap
set listchars+=extends:→              " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set virtualedit=onemore
set number
set relativenumber
set ignorecase smartcase
set nohlsearch incsearch gdefault
set hidden
"" set spell "Takes a lot of memory
set splitright splitbelow
set gdefault " use the `g` flag by default.
set tw=0
set autoread
set confirm
set nobackup nowritebackup " Turn off backup files
" set path +=**  "Instead of fuzze Finder: Allowing you to search files recursivly in root folder.
set history=500
set smarttab
set ai
set smartindent 
set tabstop=4 
set softtabstop=4 
set noet
set wildmode=longest:full,full
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set belloff=all
set formatoptions+=j " Delete comment character when joining commented lines
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set sidescrolloff=5
set cmdheight=2
set noequalalways
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set undofile
noh

set encoding=utf-8
hi Search guibg=LightBlue

" Color Scheme
set bg=dark

"====Showing trail spaces====
set listchars=nbsp:^,trail:.,tab:▸\ 
set list

"======== Some lettings ========
let g:mapleader = "\<Space>"

" Set the git timer before checking for line updates
set updatetime=100

" Making cursor square
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"======== Keys Remmaping ========
nnoremap Y y$

" To exit buffers without closing vim.
map <silent><leader>q :bp<bar>bd #<CR>
" map <leader>b <C-^>
map <leader>b :bp<CR>
map <leader>n :bn<CR>

" Get parent folder, file name and path easily 
cnoremap %H <C-R>=expand('%:h:p') . std#path#separator()<CR>
cnoremap %T <C-R>=expand('%:t')<CR>
cnoremap %P <C-R>=expand('%:p')<CR>

map <silent><leader>n :bn<CR>
" noremap <a-cr> I<CR><Esc> NOT Working atm.
" Only if set hlsearch
" map <silent><leader>n :noh<CR>

noremap <CR> A<CR><Esc>
map <silent><leader>w :w<CR>

" Make the search also center the view
noremap n nzz
noremap N Nzz

" In command mode, make ctrl h/j/k/l to act as arrows.
cmap <C-K> <Up>
cmap <C-J> <Down>
cmap <C-H> <Left>
cmap <C-L> <Right>

" in insert mode, make ctrl h/j/k/l to act as arrows.
imap <C-K> <Up>
imap <C-J> <Down>
imap <C-H> <Left>
imap <C-L> <Right>
imap <C-E> <End>
imap <C-B> <Home>

" Skip the <C-w> stuff for hjkl with alt
nnoremap  <m-h> <C-W><C-H>
nnoremap  <m-j> <C-W><C-J>
nnoremap  <m-k> <C-W><C-K>
nnoremap  <m-l> <C-W><C-L>

" resize split with <C-Arrow>
nnoremap  <C-Up> <C-W>5+
nnoremap  <C-Down> <C-W>5-
nnoremap  <C-Right> <C-W>5>
nnoremap  <C-Left> <C-W>5<

" Made jk into Esc (Might replace with <CapsLock>)
inoremap jk <Esc>
cmap jk <End><C-u><BS>

" Easy quickList navigation
nnoremap <S-Up> :cprev<CR>
nnoremap <S-Down> :cnext<CR>

" Easy tab navigation
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>

" Move Up and Down in wraped if I use it
nmap k gk
nmap j gj

" Jump to start and end of line using the home row keys
map H ^
map L $

" Make c-e c-y 3 times more effective
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>

" Make leader Y/P work with + register on vmod
vnoremap <leader>P "+P
vnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>p "+p
vnoremap <leader>y "+y
nnoremap <leader>y "+y

nnoremap <C-S> :%s//c<Left><Left>

nnoremap <silent> <C-6> <C-^>
"======== Some Commands ========

command! SumYanked :echo "Sum: " eval(join(split(@", '[^-0-9\.]\+\|\.\.\+'), '+')) <bar> let @" = string(eval(join(split(@", '[^-0-9\.]\+\|\.\.\+'), '+')))
command! WriteSudo :update !sudo tee %
command! CDC :windo lcd %:p:h
command! Count :%s///n

command! RemoveTrailingWhitespaces :%s/\s\+$//e

" For some reason it needs to be at the end of the file
set showcmd

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 20
let g:netrw_menu = 1

" Opens help in vertical
autocmd! FileType help :wincmd L | :vert resize 80
cabbrev help vert help
