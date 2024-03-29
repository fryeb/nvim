vim.cmd([[

" Reset (in case of reload)
mapclear
syntax enable
filetype plugin indent on

" Plugins
call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-sneak'
Plug 'liuchengxu/vim-which-key' 
Plug 'editorconfig/editorconfig-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'timonv/vim-cargo'
Plug 'OmniSharp/omnisharp-vim'
Plug 'rust-lang/rust.vim'

call plug#end()

" Settings
set termguicolors
set splitright
set splitbelow
set updatetime=300
set timeoutlen=10
set shortmess+=c
set signcolumn=yes
set nodigraph
set hidden

" Backup files
set nobackup
set nowritebackup
set autoread
set autowriteall

" Theme / UI
colorscheme nord
set cmdheight=1
let g:neovide_cursor_vfx_mode="wireframe"

" CoC
let g:coc_global_extensions=[ 'coc-omnisharp' ]

" CtrlP
" Note this causes ctrlp to fail when not a git repo
" We should probably fix this
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
nnoremap <silent> <leader> :WhichKey '<Space>'<cr>

nnoremap <Esc> :noh<cr>
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :b#<cr>
nnoremap <leader>q @q
nnoremap <leader>v :e $MYVIMRC<cr>
nnoremap <leader>h "hyiw :help <C-r>h
nnoremap <leader>t :terminal<cr>
nnoremap <leader>s :Startify<cr>
nnoremap <leader>e :Explore<cr>

nnoremap <leader>gs :Git<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gps :Git push<cr>
nnoremap <leader>gpl :Gpull<cr>

nnoremap <Tab> <C-w><C-w>
"nnoremap <leader>ww :wincmd w<cr>
nnoremap <leader>wv :wincmd v<cr>
nnoremap <leader>ws :wincmd s<cr>
nnoremap <leader>wq :wincmd q<cr>
nnoremap <leader>wx :wincmd x<cr>
nnoremap <leader>wh :wincmd h<cr>
nnoremap <leader>wj :wincmd j<cr>
nnoremap <leader>wk :wincmd k<cr>
nnoremap <leader>wl :wincmd l<cr>
nnoremap <leader>w= :wincmd =<cr>

nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cc<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprev<cr>
nnoremap <leader>cq :cclose<cr>
nnoremap <leader>cw :cw<cr>

nnoremap <leader>mm :make<cr>
nnoremap <leader>mc :make check<cr>

inoremap <Esc> <nop>
inoremap <Tab> <Esc>

tnoremap <Tab> <C-\><C-n>

" Disable arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

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

augroup dotnet
	au!
	au FileType cs set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab 
augroup END

augroup deutsch
	au!
	"au FileType markdown set digraph
augroup END

" TODO: Greedily generate caches
augroup ctrlp
	au!
	au FocusGained * :CtrlPClearAllCaches
augroup END

augroup rust
	au!
	au BufWritePre *.rs :RustFmt
augroup END

]])
