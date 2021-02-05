" set to python2 as that's what most plugins use
let g:python_host_prog = '/usr/bin/python2.7'
let g:loaded_python3_provider = 1

" plugin manager with nice clean control sequence and a one liner install:
"
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" OK it was 1+ lines
"
call plug#begin()
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-obsession'
  Plug 'bling/vim-airline'
  Plug 'critiqjo/lldb.nvim' "remember to :UpdateRemotePlugins
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-fugitive'
  Plug 'fmoralesc/molokayo'
  Plug 'jgdavey/tslime.vim'
call plug#end()

" enable begin/end match jumping with %
runtime macros/matchit.vim

" the tabline stuff is pretty much deprecated in airline
"  - by users, not by the author :)
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#left_sep=' '
" let g:airline#extensions#tabline#left_alt_sep='|'

syntax on
set tags=./tags;/

set hidden " allow switching away from an unsaved buffer

" line numbering on
set number "set nonu

set shiftwidth=2
set expandtab

" save/restore a file view (to get folds back)
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" autocomplete on tab
:inoremap <tab> <c-n>

" disable cursor keys. hardcore.
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

if has("nvim")
  " ESC to enter normal mode in nvim terminal
  tnoremap <ESC> <C-\><C-n>

  " alt jump window (nvim terminal mode)
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

" alt jump window (normal mode)
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
"
" window splits and close
nnoremap <A-v> <C-w>v
nnoremap <A-s> <C-w>s
nnoremap <A-c> <C-w>c

" <- diff put (dp)
noremap <A-Right> <esc>dp
" -> diff obtain (do)
noremap <A-Left> <esc>do

" unhighlight current search on Space
map <Space> :noh<cr>

" this section makes colorscheme work under PuTTY
if &term =~ "xterm"
  "256 colours
  let &t_Co = 256
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif

" select colorscheme according to whim
" molokai with molokai_original=0 is best - set terminal background colour to #1B1D1E
"
if &t_Co > 2 || has("gui_running")
" colorscheme myshell " taken from Walyd
" colorscheme toops   " taken from Ali
" colorscheme jellybeans
" colorscheme darkblue
" colorscheme monokai

  let g:molokai_original=0
  let g:rehash256=1
  colorscheme molokai
endif

set hlsearch
set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set cursorline    " highlight current line
set showcmd       " display incomplete commands
set incsearch     " do incremental searching

" disable the leader timeout completely
let mapleader=","
set ttimeout
set notimeout
" search & replace whatever is under the cursor
:nnoremap <Leader>s :%s/<C-r><C-w>/

:nmap <Leader>c :Tmux make clean<cr>
:nmap <Leader>i :Tmux make ibuild<cr>
:nmap <Leader>b :Tmux make vbuild<cr>
:nmap <Leader>v :Tmux make irun<cr>
:nmap <Leader>r :Tmux make vrun<cr>

let @m="#          ,`\\\n#     ...    /\n#   @ o o @.'\n
      \# .' ( o )\n#/  (     )\n#\.'  \\ : /\n#   nnn nnn\n"
:nnoremap <Leader>m 0"mp

" remove trailing spaces from all lines prior to saving
fun! <SID>StripTrailSpace()
   let l = line(".")
   let c = col(".")
   %s/\s\+$//e
   call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailSpace()
