set number relativenumber
set nocompatible
set colorcolumn=81
let mapleader = " "
set encoding=utf-8
set listchars=tab:\|\ 
set list
set termguicolors
set t_Co=256
set showmatch
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set splitright
set splitbelow
set clipboard=unnamedplus " Copy from vim to clipboard
set is hls
set wildmode=longest,list,full
set wildmenu
set tags=./tags,tags;$HOME
let g:python_recommended_style = 0

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator' " Navigation between vim and tmux
Plug 'preservim/nerdcommenter' " Comment and uncomment
Plug 'sheerun/vim-polyglot' " Better syntax highlight

Plug 'ayu-theme/ayu-vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'lunacookies/vim-colors-xcode'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'drazil100/dusklight.vim'

call plug#end()

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"let g:tokyonight_style = 'storm'
"let g:tokyonight_enable_italic = 1
"colorscheme dusklight
"colorscheme tokyonight
"colorscheme xcodedark
"colorscheme molokai
"colorscheme catppuccin_frappe
"colorscheme catppuccin_macchiato
"let ayucolor="mirage"
colorscheme ayu

"nmap <Esc> :nohlsearch<CR>

nmap <leader>ct <plug>NERDCommenterToggle
vmap <leader>ct <plug>NERDCommenterToggle

nmap <leader>ht :noh<CR>
vmap <leader>ht :noh<CR>
"nmap <leader>tt :TagbarToggle<CR>
"vmap <leader>tt :TagbarToggle<CR>
" Useful commands
" ===============
" gq: sets text width to 80
" gf: when cursor is on a file name, go to file
" g+t/T: go to next/prev tab
" ctrlp: when opening file press:
" -	C-v to split vertically
" -	C-s to split horizontally
" -	C-t to split in new tab
" ctrlp: to create new file:
" - C-z: mark path and allows input new file name
" - C-y: create new file
" C-]: go to definition (requires ctags)
" C-o: go to previous line
" C-w C-] opens file with definition in vertical split
" C-n or C-p while in INSERT mode will autocomplete (requires ctags)

" Window manipulation
" ===================
" C-w H: moves current window to full-height at far left
" C-w K: moves current window to full-width at the very top
