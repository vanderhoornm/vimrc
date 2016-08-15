" Airline status bar show buffers on the top
let g:airline#extensions#tabline#enabled = 1
" Airline status bar hide x (filetype) y (file format) and z (line number, etc)
let g:airline#extensions#default#layout = [ [ 'a', 'c' ], [ 'warning', 'error'] ]
" Shorten whitespace warning messages
let g:airline#extensions#whitespace#trailing_format = 't%s'
let g:airline#extensions#whitespace#long_format = 'l%s'
let g:airline#extensions#whitespace#mixed_indent_file_format = 'i%s'
let g:airline#extensions#whitespace#checks =['long', 'trailing', 'mixed-indent-file']
" Airline pretty serarators
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Fast redraw
set lazyredraw

" Show whitespace
set list

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Make vim bitch about lines longer than 100 characters
set textwidth=100
set colorcolumn=100

" Use grey relative numbering plus yellow current line number
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set number

" Plugin manager
execute pathogen#infect()

