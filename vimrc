set nocompatible
behave mswin

" ignore case if searching for all lower case
" but if caps used in search make case sensitive
set ignorecase
set smartcase

vnoremap <Left> h
vnoremap <Right> l
vnoremap <Up> k
vnoremap <Down> j
"nunmap <C-A>

noremap <Q>  <C-Q>

set number

color zenburn
"color solarized

set shiftwidth=4
set tabstop=4
set expandtab

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch


" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


" set the fonts
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 11
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
