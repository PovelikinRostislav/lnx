" GENERAL
set nocompatible

" Autoread options
set autoread
autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

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


call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'google/vim-searchindex'
call plug#end()

:let mapleader = ","
"Quick write session with F2
map <F2> :mksession! ~/.vim_session <CR>
 "And load session with F3
map <F3> :source ~/.vim_session <CR>
" Delete current Buffer
nmap <leader>w :bp<bar>bd #<CR>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Look in files
nnoremap <silent> <leader>f :Files<CR>
" Look in buffers
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
map * *zzg/
map # #zzg/
map g* g*zzg/
map g# g#zzg/
"=============================================

map <leader>e :NERDTreeToggle<CR>
map <leader>E :NERDTreeFocus<CR>
" Move line down/up
map <C-j> ddp
map <C-k> ddkkp
" Escape
vnoremap <Tab> <Esc>gV
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>" inoremap <C-m> <Esc>
" Save
map <C-s> :w<CR>
imap <C-s> <Tab>:w<CR>
map <C-x> :q<CR>

" move among buffers with CTRL
map L :bnext<CR>
map H :bprev<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'gruvbox'
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = "50"
let NERDTreeShowHidden = 1
let g:fzf_layout = { 'down': '~40%' }

" Trim on save
autocmd BufWritePre * :%s/\s\+$//e

syntax enable
colorscheme zenburn " nord monokai apprentice gruvbox tender
