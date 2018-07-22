set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" For combined usage with tmux and some easier navigation
Plugin 'christoomey/vim-tmux-navigator'

" The adio colorscheme
Plugin 'adiospace/vim-adio'
set t_Co=256
set background=dark

" For searching text across project folder
Plugin 'mileszs/ack.vim'

" For showing the project tree
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

" For some easier text commenting
Plugin 'tpope/vim-commentary'

" For showing the file's status in git
Plugin 'airblade/vim-gitgutter'

" For tmux files highlighting
Plugin 'tmux-plugins/vim-tmux'

" Status Line ehancement
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Airline configs for showing tab names
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_section_b = ''
let g:airline_section_y = ''

" Tag bar
Plugin 'majutsushi/tagbar'
map <C-t> :TagbarToggle<CR>

" Easy motion
Plugin 'easymotion/vim-easymotion'
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

" Golang plugin
" Plugin 'fatih/vim-go'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" Local VimRC
Plugin 'embear/vim-localvimrc'
" Local VimRC settings
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0

" Highlight trailing whitespaces
Plugin 'ntpeters/vim-better-whitespace'
highlight ExtraWhitespace ctermbg=darkred
let g:strip_whitespace_on_save = 1

" CtrlP fuzzy finder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set runtimepath^=~/.vim/bundle/ctrlp.vim

" YCM generator
Plugin 'rdnetto/YCM-Generator'

" Color-coded
" Plugin 'jeaye/color_coded'

" Buffer manager
" nmap <c-b> <Leader>b
Plugin 'jeetsukumaran/vim-buffergator'

" Completion engine
Plugin 'Valloric/YouCompleteMe'
autocmd CompleteDone * pclose
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" Plugin for PEP8 compliance
" Plugin 'nvie/vim-flake8'
" autocmd BufWritePost *.py call Flake8()

" Plugin for having a local wiki managed in Vim
Plugin 'vimwiki/vimwiki'

" Plugins for code formatting
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
call glaive#Install()

