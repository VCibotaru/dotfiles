call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/google.vim'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'joshdick/onedark.vim'
Plug 'adrianolaru/vim-adio'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'


call plug#end()

" Plug 'junegunn/fzf'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
map <C-p> :call fzf#run(fzf#wrap({'source': 'ag -g ""'}))<CR>

" Plug 'easymotion/vim-easymotion'
map  sf <Plug>(easymotion-bd-f)
nmap sf <Plug>(easymotion-overwin-f)
map sL <Plug>(easymotion-bd-jk)
nmap sL <Plug>(easymotion-overwin-line)
map  sw <Plug>(easymotion-bd-w)
nmap sw <Plug>(easymotion-overwin-w)

" Plug 'ntpeters/vim-better-whitespace'
highlight ExtraWhitespace ctermbg=darkred
let g:strip_whitespace_on_save=1
let g:better_whitespace_enabled=1
let g:strip_whitespace_confirm=0

" Plug 'vim-scripts/google.vim'
" Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" Plug 'google/vim-glaive'
call glaive#Install()
Glaive codefmt clang_format_style='file'
autocmd BufRead *.vue let b:codefmt_formatter = 'prettier'
autocmd BufRead *.js let b:codefmt_formatter = 'prettier'

" File tree.
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
map <C-n> :NERDTreeToggle<CR>

" Colorscheme.
" Plug 'joshdick/onedark.vim'
" syntax enable
" colorscheme onedark

" Plug 'adrianolaru/vim-adio'
syntax enable
set t_Co=256
set background=dark
colorscheme adio

" Plug 'bling/vim-airline'
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_section_b = ''
let g:airline_section_y = ''

" Plug 'neoclide/coc.nvim',
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gh :CocCommand clangd.switchSourceHeader<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')

" Other configs.
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set statusline+=%F
set laststatus=2


au BufRead *.c set colorcolumn=100 "show red line
au BufRead *.cpp set colorcolumn=100 "show red line
au BufRead *.h set colorcolumn=100 "show red line
au BufRead *.py set colorcolumn=100 "show red line
au BufRead *.tex set colorcolumn=100 "show red line
au BufRead *.js set colorcolumn=100 "show red line
au BufRead *.vue set colorcolumn=100 "show red line
au BufRead *.plog set syntax=prolog
au BufRead *.star setlocal commentstring=#\ %s

