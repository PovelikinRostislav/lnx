" GENERAL
set nocompatible



" Autocmd option to set the cpp locality for the standard headers in llvm
autocmd BufRead * if search('-*- C++ -*-', 'nw') | setlocal ft=cpp | endif



call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-fugitive'
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'
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

set term=screen-256color
set t_ut=

syntax enable

let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = "50"
let g:NERDTreeShowHidden = 1

let g:fzf_layout = { 'down': '~40%' }




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
command! -bang -nargs=* Find
  \ call fzf#vim#grep('rg --column --line-number --no-heading
  \ --no-fixed-strings --ignore-case --no-ignore --hidden --follow
  \ --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1,
  \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:40%'), <bang>0)


:let mapleader = ","

" Quick reload cfg file with F2
map <F2> :so $MYVIMRC <CR>

" Quick write session with F3
map <F3> :mksession! ~/.vim_session <CR>

" And load session with F4
map <F4> :source ~/.vim_session <CR>

" Delete current Buffer
nmap <leader>x :bp<bar>bd #<CR>

" Quick search via rg for current word
nnoremap ss :Find <C-R><C-W><CR>

" Quick search via rg for visually selected text
vnoremap ss y:Find <C-R>"<CR>

" Look pattern in all files
nnoremap <silent> <leader>s :Find <CR>

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
map ff :NERDTreeFind<CR>

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
