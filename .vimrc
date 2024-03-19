" to run python script from vim "
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3'
" syntax on "
syntax on

" this is for the vim plug in Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
" this is the bottom bar
Plug 'itchyny/lightline.vim'
" this is color scheam
Plug 'arcticicestudio/nord-vim'
" this is file manager
Plug 'preservim/nerdtree'
" this is color s
Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/iceberg.vim'
" show file icons and other icons
Plug 'ryanoasis/vim-devicons'
" Better Comments
Plug 'tpope/vim-commentary'
" emmet for html
Plug 'mattn/emmet-vim'
" vim multiple cursor
Plug 'terryma/vim-multiple-cursors'
" ale plug in for syntax check asynchronously :
Plug 'dense-analysis/ale'
" auto format code by prettier
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'chiel92/vim-autoformat'
" This is for C# development
Plug 'OmniSharp/omnisharp-vim'
" audo close bracket
Plug 'jiangmiao/auto-pairs'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
let g:deoplete#enable_at_startup = 1

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" lets set the color scame
" set termguicolors     " enable true colors support
" let ayucolor="dark"
" colorscheme iceberg
" colorscheme ayu
" colorscheme humanoid
colorscheme nord
" nerd tree on ctl+f
nmap <C-f> :NERDTreeToggle<CR>

" fzf file in ctrl+n
map <C-p> :Files<CR>
" nerdtree winsize
let NERDTreeWinSize=20
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1



"this is for the icon
set encoding=UTF-8

" show line nubmer
set number relativenumber
" set cursor line
set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold
" move visually selected lines up or down in various modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" auto indentline
set autoindent

" copy paste in vim
" vnoremap <C-c> "*y :let @+=@*<CR>
" vnoremap <C-y> "+y
" map <C-v> "+P
" vnoremap <C-
noremap <C-c> "+y
noremap <C-v> "+p
" this is for the alacritty terminal
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"
" split navigation to ctrl+j instead of ctrl+w
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" open split between botton and right
set splitbelow
set splitright
" note to resize splited window
" ctrl+w _ <- height of the current screen
" ctrl+w | <- width of the current screen
" ctrl+w = <- normalize all split

" Replace all is aliased to S
nnoremap S :%s//g<Left><Left>
" remove all blank line
nnoremap M :g/^\s*$/d

" this is for neovide
set guifont=Fira\ Code:h12
colorscheme default
set notermguicolors
highlight Search ctermfg=0
