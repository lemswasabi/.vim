" ---Colors--- {{{
colorscheme badwolf " awesome colorscheme
syntax enable " enable syntax processing
" }}}

" ---Spaces and Tabs {{{
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
" }}}

" ---Movements-- {{{
nnoremap B 0
nnoremap E $
nnoremap 0 <nop>
nnoremap $ <nop>
nnoremap gV `[v`]
inoremap jk <ESC>
" }}}

" ---UI Config--- {{{
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set showmatch " highlihgt matching [{()}]
"}}}

" ---Searching--- {{{
set incsearch " search as characters are entered
set hlsearch " highlight maches
" }}}

" ---Tmux--- {{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}} 

" ---Organization--- {{{
set modelines=1
" }}}

" vim:foldmethod=marker:foldlevel=0
