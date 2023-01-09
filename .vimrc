" Airline status bar show buffers on the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" let airline#extensions#tabline#disable_refresh = 0
" Airline status bar hide x (filetype) y (file format) and z (line number, etc)
let g:airline#extensions#default#layout = [ [ 'a', 'c' ], [ 'warning', 'error'] ]
" Shorten whitespace warning messages
let g:airline#extensions#whitespace#checks =[]
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

" Search function
nmap <F4>s :cscope find s <C-R>=expand("<cword>")<CR><CR>
nmap <F4>g :cscope find g <C-R>=expand("<cword>")<CR><CR>
nmap <F4>c :cscope find c <C-R>=expand("<cword>")<CR><CR>
nmap <F4>t :cscope find t <C-R>=expand("<cword>")<CR><CR>
nmap <F4>e :cscope find e <C-R>=expand("<cword>")<CR><CR>
nmap <F4>f :cscope find f <C-R>=expand("<cfile>")<CR><CR>
nmap <F4>i :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <F4>d :cscope find d <C-R>=expand("<cword>")<CR><CR>

" Update cscope function
nmap <F5> :execute '!cscope -b -k -R && ctags -R .' <CR><CR>
tmap <F5> cscope -b -k -R && ctags -R .<CR>
cscope add cscope.out
set cscopetag
set cscopetagorder=1

" Pull from svn
nmap <F6> :execute '!git fetch origin --tags --prune && tig && git merge' <CR>
tmap <F6> git fetch origin --tags --prune && tig && git merge<CR>

" Make function
nmap <F7> :silent make clean<Bar>redraw!<Bar>cw<CR>
tmap <F7> make clean<CR>
nmap <F8> :silent make<Bar>redraw!<Bar>cw<CR>
tmap <F8> make<CR>

nmap <F10> :botright vertical terminal<CR>

" Next / Prev marker
nmap <C-N> :cn<CR>
nmap <C-P> :cp<CR>

" Search highlighted text
vmap // y/<C-R>"<CR>

" Plugin manager
execute pathogen#infect()

" Do any project specific stuff
let project_config_file = '.project.vimrc'
if filereadable(project_config_file)
	execute 'source' project_config_file
endif

