"© Leminh Nguyen
" 24/04/19

" ---Spaces and Tabs{{{
set tabstop=2 "number of visual spaces per TAB
"set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=2
"set smartindent
"set autoindent
" }}}

"---Folding---{{{
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=marker " fold based on indent level
" }}}

" ---Mapping--{{{
let mapleader="," " leader is comma
let maplocalleader=";" " local leader is semi collon

"commands
nnoremap <leader>em :exec "e " . $HOME . "/.vim/vimrc"<cr>
nnoremap <leader>sm :exec "so " . $MYVIMRC<cr>
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <buffer> <F10> :exec '!python -i' shellescape(@%, 1)<cr>
nnoremap <leader>sb :exec '!swift build'<cr>
nnoremap <leader>sr :exec '!swift run'<cr>
nnoremap <buffer> <F5> :exec '!swift run'<cr>
nnoremap <F8> :w<cr>:!gcc main.c -o main && ./main<cr>

"bash script
nnoremap <F2> :!./%<cr>

"vim
inoremap jk <ESC>
tnoremap jk <esc>
nnoremap <leader>ww :w<cr>
nnoremap B 0
nnoremap E $
nnoremap 0 <nop>
nnoremap $ <nop>
nnoremap gV `[v`]
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <space> za
nnoremap <leader>ba :badd %<cr>
nnoremap <leader>yp "+yip
nnoremap <leader>ap gqip
nnoremap <leader>qq :q<cr>

"editing
inoremap {<cr> {<cr>}<ESC>O
nnoremap oo o<Esc>o<Esc>k

"settings
nmap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<cr>
nmap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<cr>
nnoremap <leader>ig :IndentGuidesToggle<cr>

" fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>bf :Buffers<cr>
nnoremap <leader>l :Lines<cr>

" latex
nnoremap <leader>cw :!./texcount.pl -total -inc main.tex<cr>
nnoremap <localleader>cw :VimtexCountWords<cr>
nnoremap <F4> :w<cr>:!pdflatex main.tex<cr>
nnoremap <localleader><F4> :w<cr>:!pdflatex main.tex<cr>:!open main.pdf<cr><cr>
nnoremap <leader><F4> :exec '!bibtex ' . 'main.aux'<cr>
nnoremap <leader>vp :!open main.pdf<cr><cr>

" git
nnoremap <leader>gs :G<cr>

" }}}

" ---UI Config---{{{
set number "show number
set relativenumber " show reative numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set showmatch " highlihgt matching [{()}]
set laststatus=2
set noshowmode
"}}}

" ---Searching---{{{
set incsearch " search as characters are entered
set hlsearch " highlight maches
" }}}

" ---Organization---{{{
set modelines=1
" }}}

" ---Plugins---{{{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'noahfrederick/vim-skeleton'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-fugitive'

call plug#end()


" }}}

" ---Colors---{{{
"syntax enable
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
let g:gruvbox_italic=1
colorscheme gruvbox
syntax enable " enable syntax processing
let g:gruvbox_contrast_dark='hard'
set bg=dark

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" }}}

"---Settings---{{{
set backspace=indent,eol,start
set linebreak 
set textwidth=80

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 
      \ 'swift': { 'left': '//', 'right': '', 'leftAlt': '/*', 'rightAlt':
      \ '*/'},
      \ 'python': { 'left': '#', 'right': ''},
      \ 'c': { 'left': '//', 'right': '', 'leftAlt': '/*', 'rightAlt':
      \ '*/'},
      \}

let b:ale_linters = ['swiftlint']

" }}}

" ---Floatingterm{{{
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2). "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction "}}}

" vim:foldmethod=marker:foldlevel=0
