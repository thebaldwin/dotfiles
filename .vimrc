syntax on
set title
colorscheme lucius
set autoindent
set bs=2

set t_Co=256
set nobackup
set bg=light

set nowrap
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set number
set paste

filetype on
augroup filetypedetect
  au! BufRead,BufNewFile *.god setfiletype ruby
  au! BufRead,BufNewFile *.rb setfiletype ruby
augroup END

autocmd filetype make setlocal ts=4 sts=4 sw=4 noexpandtab

filetype indent on
syntax on

set tags=TAGS;/
set hlsearch

map <f9> :w<cr>:!ruby %<cr>
map <f8> :TlistToggle<cr>
map <f7> :NERDTreeToggle<cr>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-Right> gt
map <C-Left> gT

vmap <tab> >gv
vmap <S-tab> <gv

vmap \br :call BeginRescue()<CR>

function! BeginRescue() range
  '<
  exe "normal! Obegin\<Esc>"
  '>
  exe "normal! orescue Exception => e\<cr>\<cr>end\<Esc>"
  '<,'> :substitute/^/  /
endfunction

