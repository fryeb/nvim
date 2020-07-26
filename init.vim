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
Plug 'liuchengxu/vim-which-key' 
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

" Settings
set hidden
set splitright
set updatetime=300
set timeoutlen=10
set shortmess+=c
set signcolumn=yes

" Theme / UI
colorscheme nord
set cmdheight=1

" Backup files
set nobackup
set nowritebackup
set autowriteall

" Key Mappings
let mapleader=" "
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

nnoremap <Esc> :noh<cr>
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>q @q
nnoremap <leader>v :vsplit $MYVIMRC<cr>
nnoremap <leader>h "hyiw :help <C-r>h
nnoremap <leader>H :helpclose<cr>

nnoremap <leader>gs :Git<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gc :Gcommit<cr>

nnoremap <leader>ww :wincmd w<cr>
nnoremap <leader>wv :wincmd v<cr>
nnoremap <leader>ws :wincmd s<cr>
nnoremap <leader>wq :wincmd q<cr>
nnoremap <leader>wx :wincmd x<cr>

inoremap <Esc> <nop>
inoremap jk <Esc>
inoremap kj <Esc>

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

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

" Autocommands
augroup basic
	au!
	au FocusLost * silent! :write
	au BufNewFile * :write
	au BufWritePre * :normal gg=G''
	au BufWritePost *.vim :source $MYVIMRC
augroup END

augroup layout
	au!
	au FileType help wincmd L
	au FileType fugitive wincmd L
	au FileType gitcommit wincmd L
augroup END

