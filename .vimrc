
" --- General Settings ---
set number          " Show line numbers
set relativenumber  " Show relative line numbers (set rnu)
set ignorecase      " Case insensitive searching
set smartcase       " Override ignorecase if search contains capitals

" --- Normal Mode Mappings ---
" Map { to start of line and } to end of line
nnoremap { 0
nnoremap } $
vnoremap { 0
vnoremap } $

" Space + x closes the current buffer
nnoremap <leader>x :bd<CR>
let mapleader = " "

" Toggle search highlighting and ignorecase
nnoremap <leader>0 :set hlsearch!<CR>
nnoremap <leader>i :set ignorecase!<CR>

" --- The Paste Logic ---
" p: Pastes without overwriting your register with the deleted text
xnoremap p "_dP

" P: The 'Classic' Vim behavior (pastes and yanks the replaced text)
xnoremap P p

" --- Finnish Keyboard Optimizations (Insert Mode) ---
inoremap å <Esc>
nnoremap å <Esc>
vnoremap å <Esc>
cnoremap å <C-c>

set ttimeoutlen=50

