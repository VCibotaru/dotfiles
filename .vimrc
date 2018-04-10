set nocompatible              " be iMproved, required
filetype off                  " required

source ~/.vim/plugins.vim
colorscheme adio

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set statusline+=%F
set laststatus=2
syntax enable

source ~/.vim/c_cpp.vim
" source ~/.vim/python.vim


au BufRead *.py set colorcolumn=80 "show red line
au BufRead *.tex set colorcolumn=80 "show red line

" au BufRead *.tex set spell spelllang=en_us " enable spell check
" au BufRead *.txt set spell spelllang=en_us " enable spell check

" To keep the copy buffer between terminal windows
set clipboard=unnamedplus
"
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


"nnoremap <C-J> <C-W><C-J> "Ctrl-j to move down a split
"nnoremap <C-K> <C-W><C-K> "Ctrl-k to move up a split
"nnoremap <C-L> <C-W><C-L> "Ctrl-l to move    right a split
"nnoremap <C-H> <C-W><C-H> "Ctrl-h to move left a split

