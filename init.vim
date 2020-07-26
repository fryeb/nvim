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
Plug 'editorconfig/editorconfig-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'mhinz/vim-startify'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

" Settings
set hidden
set splitright
set splitbelow
set updatetime=300
set timeoutlen=10
set shortmess+=c
set signcolumn=yes

" Backup files
set nobackup
set nowritebackup
set autowriteall

" Theme / UI
colorscheme nord
set cmdheight=1

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Sneak
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Key Mappings
let mapleader=" "
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

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
nnoremap <leader>gl :Glog<cr>

nnoremap <leader>ww :wincmd w<cr>
nnoremap <leader>wv :wincmd v<cr>
nnoremap <leader>ws :wincmd s<cr>
nnoremap <leader>wq :wincmd q<cr>
nnoremap <leader>wx :wincmd x<cr>
nnoremap <leader>wh :wincmd h<cr>
nnoremap <leader>wj :wincmd j<cr>
nnoremap <leader>wk :wincmd k<cr>
nnoremap <leader>wl :wincmd l<cr>

nnoremap <leader>cc :cc<cr>
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>
nnoremap <leader>cq :ccl<cr>
nnoremap <leader>cw :cw<cr>

inoremap <Esc> <nop>
inoremap jk <Esc>
inoremap kj <Esc>

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
	au WinLeave * silent! :write
	au BufNewFile * :write
	au InsertLeave * :normal =%
augroup END

augroup layout
	au!
	au FileType help wincmd L
	au FileType fugitive wincmd L
	au FileType gitcommit wincmd L
augroup END

augroup meta
	au!
	au BufWritePost *.vim :source $MYVIMRC
augroup END

