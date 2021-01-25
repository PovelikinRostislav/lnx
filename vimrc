" disable backward compatibility
set nocompatible


" highlight search matches
set hlsearch
" incremental search matching while typing
set incsearch
" case insensitive search
set ignorecase
" stop search when hit the bottom/top
set nowrapscan
" no wrapping over the line
set nowrap
" redraw only when needed
set lazyredraw
" show commands in the bottom right corner
set showcmd
" don't show mode (Airline will show it)
set noshowmode
" show line numbers
set number
" add syntax highlightings
syntax enable
" visual autocomplete for command menu
set wildmenu
" highlight matching [{()}]
set showmatch
" show hidden symbols
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
" highligh current line
set cursorline


" number of mandatory visible lines before and after the cursor line
set scrolloff=10
" number of visual spaces per TAB
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
" tabs are spaces
set expandtab


" auto trim on save
autocmd BufWritePre * :%s/\s\+$//e
" auto install vim-plug if it's not
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" load needed plugins
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/installed/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jacoborus/tender.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()


" plugin configurations
colorscheme gruvbox
set background=dark

let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#left_sep=' '
let g:airline_skip_empty_sections=1
let g:airline#extensions#tabline#formatter='unique_tail'

let g:NERDTreeWinSize="50"
let g:NERDTreeWinPos="right"
let g:NERDTreeShowHidden=1

" function which stands for grepping via rg in fzf disabling fuzzy search
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" set proper leader instead of '\'
let mapleader=" "

" edit vimrc/zshrc/ripgrep
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>ez :e ~/.zshrc<CR>
nnoremap <leader>er :e ~/.ripgreprc<CR>
" reload vimrc
noremap <F2> :so $MYVIMRC<CR>
" search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" toggle off search highlight
nnoremap <silent> <leader>c  :noh<CR>
" jump down for the first empty line
nnoremap J }
vnoremap J }
" jump up for the first empty line
nnoremap K {
vnoremap K {
" jump to a tag
nnoremap <leader>t :tag <C-R><C-W><CR>
vnoremap <leader>t :tag <C-R><C-W><CR>
" switch between buffers
nnoremap L :bn<CR>
nnoremap H :bp<CR>
" close current buffer switching to previous
nnoremap <leader>x :bp<bar>bd #<CR>
" save buffer
noremap <C-x> <ESC>:w<CR>
inoremap <C-x> <ESC>:w<CR>
" close current window
nnoremap <leader>q :q<CR>
" open project tree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>E :NERDTreeFocus<CR>
nnoremap <leader>F :NERDTreeFind<CR>
" open FZF windows
nnoremap <leader>f :Files!<CR>
nnoremap <leader>s :RG!<CR>
nnoremap <leader>l :BLines!<CR>
nnoremap <leader>L :Lines!<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :Helptags<CR>
" Search mathes will be centered on the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *Nzz
nnoremap # #Nzz
