"© Leminh Nguyen
" 11/03/20

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
nnoremap <buffer> <F10> :exec'!python3 -i' shellescape(@%, 1)<cr>
nnoremap <leader>sb :exec '!swift build'<cr>
nnoremap <leader>sr :exec '!swift run'<cr>
nnoremap <buffer> <F5> :exec '!swift run'<cr>
nnoremap <F8> :w<cr>:!gcc main.c -o main && ./main<cr>
nnoremap <leader><F1> :!javac %<cr>
nnoremap <localleader><F1> :!java %:r<cr>

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
nnoremap <leader>yp "+yip
nnoremap <leader>wp gqip
nnoremap <leader>qq :q<cr>
map <C-n> :NERDTreeToggle<cr>
nnoremap <localleader>pi :PlugInstall<cr>
nnoremap <localleader>rt :%s/\s\+$//e<cr>

"editing
inoremap {<cr> {<cr>}<ESC>O
nnoremap <leader>oo o<esc>o<esc>k

"ultisnips
nnoremap <localleader>us :UltiSnipsEdit<cr>

"settings
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

" filetype
nnoremap <localleader>F :exec ":tabnew ~/.vim/ftplugin/" . &filetype . ".vim"<cr>

" skeleton
nnoremap <localleader>S :exec ":vs ~/.vim/templates/skel." . &filetype<cr>

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

if has('nvim')
  Plug 'morhetz/gruvbox'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'preservim/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'noahfrederick/vim-skeleton'
	Plug 'tpope/vim-surround'
	Plug 'sheerun/vim-polyglot'
	Plug 'lervag/vimtex'
	Plug 'sirver/ultisnips'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'editorconfig/editorconfig-vim'
endif

call plug#end()

" }}}

" ---Colors---{{{
syntax enable " enable syntax processing
set bg=dark

if has('nvim')
	colorscheme gruvbox
	let g:gruvbox_italic=1
	let g:gruvbox_contrast_dark='hard'
	set bg=dark
	let g:lightline = {
				\ 'colorscheme': 'wombat',
				\ 'active': {
				\   'left': [ [ 'mode', 'paste' ],
				\             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
				\ },
				\ 'component_function': {
				\   'cocstatus': 'coc#status',
				\   'gitbranch': 'fugitive#head'
				\ },
				\ }
  " Use auocmd to force lightline update.
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
endif

" }}}

"---Settings---{{{
set backspace=indent,eol,start
set linebreak 
set textwidth=80

if has('nvim')
	let g:NERDSpaceDelims = 1
	let g:NERDDefaultAlign = 'left'
	let g:NERDCustomDelimiters = { 
				\ 'swift': { 'left': '//', 'right': '', 'leftAlt': '/*', 'rightAlt':
				\ '*/'},
				\ 'python': { 'left': '#', 'right': ''},
				\ 'c': { 'left': '//', 'right': '', 'leftAlt': '/*', 'rightAlt':
				\ '*/'},
				\}

	let g:polyglot_disabled = ['latex']

	" python link
	let g:python_host_prog  = '/usr/bin/python2'
	let g:python3_host_prog = '/usr/local/bin/python3'
endif

" }}}

"---Tags---{{{
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
"}}}

" vim:foldmethod=marker:foldlevel=0 
