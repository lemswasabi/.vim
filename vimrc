"© Leminh Nguyen
" 24/04/19

" ---Spaces and Tabs{{{
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
" }}}

"---Folding---{{{
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
" }}}

" ---Mapping--{{{
let mapleader="," " leader is comma

nnoremap B 0
nnoremap E $
nnoremap 0 <nop>
nnoremap $ <nop>
nnoremap gV `[v`]
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <buffer> <F10> :exec '!python -i' shellescape(@%, 1)<cr>
nnoremap <buffer> <F4> :exec '!pdflatex' shellescape(@%, 1)<cr>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <space> za
map <C-o> :NERDTreeToggle<CR>
nnoremap ; :Files<CR>
nnoremap oo o<Esc>o<Esc>k
nnoremap <leader>em :exec "e " . $MYVIMRC<CR>
nnoremap <leader>sm :exec "so " . $MYVIMRC<CR>

inoremap jk <ESC>

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

" ---Tmux---{{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
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

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'fredkschott/covim'

call plug#end()
" }}}

" ---Colors---{{{
let g:gruvbox_italic=1
colorscheme gruvbox
syntax enable " enable syntax processing
let g:gruvbox_contrast_dark='hard'
set bg=dark

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

" }}}

"---Settings---{{{
set backspace=indent,eol,start
set linebreak
set textwidth=80
" }}}

" vim:foldmethod=marker:foldlevel=0
