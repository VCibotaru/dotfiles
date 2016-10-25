set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" For combined usage with tmux and some easier navigation
Plugin 'christoomey/vim-tmux-navigator'
" The adio colorscheme
Plugin 'adrianolaru/vim-adio'
" For searching text across project folder
Plugin 'mileszs/ack.vim'
" For showing the project tree
Plugin 'scrooloose/nerdtree'
" For some easier text commenting
Plugin 'tpope/vim-commentary'
" For syntax checking
Plugin 'scrooloose/syntastic'
" For showing the file's status in git
Plugin 'airblade/vim-gitgutter'
" For tab completion
" Plugin 'ervandew/supertab'
" For tmux files highlighting
Plugin 'tmux-plugins/vim-tmux'
" Status Line ehancement
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Tag bar
Plugin 'majutsushi/tagbar'
" Easy motion
Plugin 'easymotion/vim-easymotion'

" Easy motion configs
" ------------------------------------

" <Leader>f{char} to move to {char}
map  sf <Plug>(easymotion-bd-f)
nmap sf <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map sL <Plug>(easymotion-bd-jk)
nmap sL <Plug>(easymotion-overwin-line)

" Move to word
map  sw <Plug>(easymotion-bd-w)
nmap sw <Plug>(easymotion-overwin-w)
" Done easy motion configs
" ------------------------------------

" Shortcut for tagbar
map <C-t> :TagbarToggle<CR>

" Vim airline colors and fonts
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_section_b = ''
let g:airline_section_y = ''

" Completion engine
Plugin 'Valloric/YouCompleteMe'
autocmd CompleteDone * pclose
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"


Plugin 'ternjs/tern_for_vim'
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" CTRLP plugin variables
set runtimepath^=~/.vim/bundle/ctrlp.vim

" NERDTree key mappings
map <C-n> :NERDTreeToggle<CR>

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" solarized options
syntax enable 
set t_Co=256
set background=dark
colorscheme adio
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set number
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set statusline+=%F
set laststatus=2

au BufRead *.c set colorcolumn=80 "show red line 
au BufRead *.cpp set colorcolumn=80 "show red line 
au BufRead *.py set colorcolumn=80 "show red line 

au BufRead *.tex set spell spelllang=en_us " enable spell check
au BufRead *.txt set spell spelllang=en_us " enable spell check

" To keep the copy buffer between terminal windows
set clipboard=unnamed
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


nnoremap <C-J> <C-W><C-J> "Ctrl-j to move down a split  
nnoremap <C-K> <C-W><C-K> "Ctrl-k to move up a split  
nnoremap <C-L> <C-W><C-L> "Ctrl-l to move    right a split  
nnoremap <C-H> <C-W><C-H> "Ctrl-h to move left a split  

