" Airline status bar show buffers on the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" let airline#extensions#tabline#disable_refresh = 0
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

" Maintain undo history between sessions
set undodir=/tmp/.vim/undodir
set undofile

" Use grey relative numbering plus yellow current line number
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set number

" Highlight search by default
set hlsearch

if !&diff
  " Make colours better
  set bg=light
endif

" workaround for https://github.com/vim/vim/issues/1start671
if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    set t_BE=
  endif
endif

" Split window navigation
nmap <F1><F1> :1 wincmd w<CR>
nmap <F1><F2> :2 wincmd w<CR>
nmap <F1><F3> :3 wincmd w<CR>
nmap <F1><F4> :4 wincmd w<CR>
nmap <F1><F5> :5 wincmd w<CR>
nmap <F1><F6> :6 wincmd w<CR>
tmap <F1><F1> <C-W>:1 wincmd w<CR>
tmap <F1><F2> <C-W>:2 wincmd w<CR>
tmap <F1><F3> <C-W>:3 wincmd w<CR>
tmap <F1><F4> <C-W>:4 wincmd w<CR>
tmap <F1><F5> <C-W>:5 wincmd w<CR>
tmap <F1><F6> <C-W>:6 wincmd w<CR>

" Copy selected text to clipboard
xmap <F2> :'<,'>write !xclip -selection clipboard -in<CR><CR>
" Paste clipboard text before current line
nmap <F2> :-read !xclip -selection clipboard -out<CR><CR>

" Search function
nmap <F4> :execute 'vimgrep /\<'.expand('<cword>').'\>/j **' <Bar> cw<CR>

" Update ctags function
nmap <F5> :execute '!ctags -R .' <CR><CR>

" Pull from svn
nmap <F6> :execute '!svn up' <CR><CR>

" Make function
nmap <F8> :silent make\|redraw!\|cw<CR>

" Plugin manager
execute pathogen#infect()

" Do any project specific stuff
let project_config_file = '.project.vimrc'
if filereadable(project_config_file)
	execute 'source' project_config_file
endif

