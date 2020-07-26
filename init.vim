" Plugins
call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-sneak'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

" Theme / UI
colorscheme nord
set cmdheight=1

" Backup files
set nobackup
set nowritebackup
set autowriteall

" Key Mappings
let mapleader=" "

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

nnoremap <Esc> :noh<cr>
nnoremap <leader><leader> <C-w>w
nnoremap <leader>w <C-w>
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>q @q
nnoremap <leader>v :wa<cr> :source $MYVIMRC<cr>
nnoremap <leader>g :G

inoremap <Esc> <nop>
inoremap jk <Esc>
inoremap kj <Esc>

" Autocommands
au FocusLost * silent! wa

" Statusline
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·LINE ',
       \ '' : 'V·BLOCK ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·REPLACE ',
       \ 'c'  : 'COMMAND ',
       \}

set statusline=
set statusline+=%#StatusLine#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=\ %f:%l:%c
set statusline+=\ %#StatusLineNC#
set statusline+=%=
set statusline+=%#StatusLine#
set statusline+=\ %m
set statusline+=\ %{FugitiveStatusline()}

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Misc
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
