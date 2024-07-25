set number relativenumber
set nocompatible
set colorcolumn=80
let mapleader = " "
set encoding=utf-8
set listchars=tab:\|\ 
set list
set termguicolors
set t_Co=256
set showmatch
set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus " Copy from vim to clipboard
set is hls
let g:python_recommended_style = 0

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator' " Navigation between vim and tmux

"Plug 'preservim/tagbar' " Display tag symbols of file in a sidebuffer

Plug 'preservim/nerdcommenter' " Comment and uncomment

Plug 'sheerun/vim-polyglot' " Better syntax highlight

Plug 'ayu-theme/ayu-vim'
Plug 'haishanh/night-owl.vim'
Plug 'tomasr/molokai'

call plug#end()

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"colorscheme night-owl
colorscheme molokai
"colorscheme ayu
"let g:airline_theme='ayu_dark'

"nmap <Esc> :nohlsearch<CR>

nmap <leader>ct <plug>NERDCommenterToggle
vmap <leader>ct <plug>NERDCommenterToggle

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
