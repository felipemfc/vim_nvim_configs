" .vimrc
" Felipe Moura

""" Auto install vim-plug -------------------------------------------
let neovim = has('nvim')
let data_dir = neovim ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

""" Geral -----------------------------------------------------------
set number " show line number
set mouse=a " allows mouse to be used
set autoindent " new lines inherit the identetions of previous line
set copyindent
set hlsearch

set cursorline
set hidden
set shiftwidth=4 " number of spaces to use for autoindenting
set splitright
set clipboard=unnamed
syntax enable

" disable annoying beep
set noerrorbells
set vb t_vb=

" status line
set stl=%f\ %m\ %r\ line\ %l\ of\ %L\ [%p%%],\ column\ %c%=Type:%y
set laststatus=2

" set shell
if has('unix')
  let shell='bash'
endif

" autocomplete
set complete+=kspell
set shortmess+=c
set completeopt=menuone,longest,preview

"" Maps +
" general
imap jk <Esc>
nmap <C-s> :w<cr>
nmap <F9> :w<cr>:!pipenv run python3 %<cr>
nmap <Tab><Tab> <C-w><C-w>
nmap <Tab>t :bn<cr>
nmap <Tab>d :bdelete<cr>

" disables arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

""" Plugins ---------------------------------------------------------
call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'vim-scripts/AutoComplPop'
	Plug 'vim-airline/vim-airline'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	if neovim
	    Plug 'neovim/nvim-lspconfig'
	    Plug 'nvim-lua/plenary.nvim'
	    Plug 'nvim-telescope/telescope.nvim'
	    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	endif
call plug#end()

"" Plug options ++
" NERDtree options
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Onehalf theme options
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
let g:lightline= { 'colorscheme': 'onehalfdark' }

" Vim Airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''

"" Neovim only plugigns config ++
if neovim
    
    " Telescope shortcuts
    nnoremap ff :Telescope find_files<cr>
    nnoremap fg :Telescope live_grep<cr>
    nnoremap fb :Telescope buffers<cr>
    nnoremap fh :Telescope help_tags<cr>
    nnoremap fs :Telescope git_status<cr>
    nnoremap fd :Telescope file_browser<cr>

endif
