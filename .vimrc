syntax on

set title

colorscheme lucius
set autoindent
set si
set bs=2
set t_Co=256

set nobackup
set noswapfile
set nowb
set bg=dark

set nowrap
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set nocp
filetype plugin on

set ofu=syntaxcomplete#Complete

let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::

set number

filetype on
augroup filetypedetect
  au! BufRead,BufNewFile *.god setfiletype ruby
  au! BufRead,BufNewFile *.rb setfiletype ruby
  au! BufRead,BufNewFile *.erb setfiletype erb
  au! BufRead,BufNewFile *.ru setfiletype ruby
augroup END

au FileType css imap : :<c-x><c-o>
autocmd! bufwritepost .vimrc source ~/.vimrc

autocmd filetype make setlocal ts=4 sts=4 sw=4 noexpandtab

"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

filetype indent on

set tags=TAGS;/
set tags+=~/.vim/tags/cpp
set hlsearch

let g:fuf_dir_exclude='\v(^|[/\\])(\.(hg|git|bzr))($|[/\\])'
let g:fuf_file_exclude='\v\~$|\.(o|exe|dll|bak|sw[po])$|(^|[/\\])(\.(hg|git|bzr))($|[/\\])'

map <f9> :w<cr>:!ruby %<cr>
map <f8> :TlistToggle<cr>
map <f7> :NERDTreeToggle<cr>
map <f6> :set nopaste<cr>:FufFile **/<cr>

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

map <leader>v :tabnew ~/.vimrc<cr>
map <leader>e :cn<cr>
map <leader>w :cp<cr>
map - :nohls<cr>
