set updatetime=10
set ignorecase
set smartcase
set termguicolors
set t_Co=256
if &term =~ '256color'
    set t_ut=
endif
set number relativenumber
set wildmode=longest,list,full
set splitbelow splitright
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
set nofoldenable
set t_Co=256
" set background=dark
set termguicolors
set encoding=utf-8
set timeoutlen=10
let python_highlight_all = 1
let g:ycm_autoclose_preview_window_after_completion=1
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif
autocmd BufNewFile,BufRead *.rasi set syntax=css
" map <C-p> "+P
" vnoremap <C-c> "*Y :let @+=@<CR>
" map <C-q> quit!
nmap <tab> gt
nmap <shift-tab> gT
nnoremap <C-b> <C-O>:w<CR>
inoremap <C-b> <C-O>:w<CR>
nnoremap <space><J> <C-W><C-J>
nnoremap <space><K> <C-W><C-K>
nnoremap <space><L> <C-W><C-L>
nnoremap <space><H> <C-W><C-H>
let g:ycm_autoclose_preview_window_after_completion = 1 
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
set viminfo+=n~/.vim/viminfo
set nu rnu
nnoremap <silent> <F2> :set relativenumber! <bar> set nu!<CR>

