" GENERAL
set nocompatible



" Autoread options
set autoread
autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
autocmd BufWritePost * GitGutter
autocmd BufRead * if search('-*- C++ -*-', 'nw') | setlocal ft=cpp | endif



call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mileszs/ack.vim'
Plug 'rhysd/vim-clang-format'
Plug 'airblade/vim-gitgutter'
call plug#end()






" The following command scrolls the text so that (when possible) there are
" always at least five lines visible above the cursor, and five lines visible
" below the cursor:
set scrolloff=10
" number of visual spaces per TAB
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
" number of spaces to be shifted
set shiftwidth=4
" tabs are spaces
set expandtab
" no wrap
set nowrap
" set the mouse in mode 'all'
set mouse=a
" show line numbers
set number
" show whitespaces and tabs
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
" highlight current line
set cursorline
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to
set lazyredraw
" Can move one more character after line end
set virtualedit=onemore
" show command in bottom bar
set showcmd
set showmode
" highlight matching [{()}]
set showmatch
" ignore case when searching
set ignorecase
" search as characters are entered
set incsearch
" highlight matches
set hlsearch
" incremental search stop at end of file
set nowrapscan
" updatetime is useful for git changes
set updatetime=100


let g:gitgutter_highlight_lines = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'gruvbox'
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = "50"
let g:NERDTreeShowHidden = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

syntax enable
let g:seoul256_light_background = 256
colorscheme seoul256-light " zenburn nord monokai apprentice gruvbox tender

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, '--word-regexp',
  \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'},
  \ 'up:60%'))




:let mapleader = ","

" Quick reload cfg file with F2
map <F2> :so $MYVIMRC <CR>

" Quick write session with F3
map <F3> :mksession! ~/.vim_session <CR>

" And load session with F4
map <F4> :source ~/.vim_session <CR>

" Delete current Buffer
nmap <leader>x :bp<bar>bd #<CR>

" Quick search via Ag for current word
nnoremap <silent> ss :Ag <C-R><C-W><CR>

" Quick search via Ag for visually selected text
vnoremap ss y:Ag <C-R>"<CR>

" Look pattern in all files
nnoremap <silent> <leader>s :Ag <CR>

" Look files
nnoremap <silent> <leader>f :Files<CR>

" Look buffers
nnoremap <silent> <leader>b :Buffers<CR>

" Search visually selected text
vnoremap // y/<C-R>"<CR>

" Jump down for the first empty line
noremap J }

" Jump up for the first empty line
noremap K {

"=============================================
" Search mathes will be centered on the screen
map n nzzg/
map N Nzzg/
map * *zzNg/
map # #zzNg/
map g* g*zzg/
map g# g#zzg/
"=============================================




map <leader>e :NERDTreeToggle<CR>
map <leader>E :NERDTreeFocus<CR>

" Move line down/up
map <C-j> ddp
map <C-k> ddkkp

" Save
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
map <C-x> :q<CR>

" move among buffers
map L :bnext<CR>
map H :bprev<CR>

" Resize vertical split
map <C-h> :vertical resize +1<CR>
map <C-l> :vertical resize -1<CR>

" Trim on save
autocmd BufWritePre * :%s/\s\+$//e
