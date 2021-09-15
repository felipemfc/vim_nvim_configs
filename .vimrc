" .vimrc
" Felipe Moura

" Geral
set number " show line number
"set relativenumber
set mouse=a " allows mouse to be used
set autoindent " new lines inherit the identetions of previous line
set copyindent
set hlsearch

set cursorline
set hidden
set shiftwidth=4 " number of spaces to use for autoindenting
set splitright
set clipboard=unnamed

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
" Just use CTRL + P to show the menu
set complete+=kspell
set shortmess+=c
set completeopt=menuone,longest,preview

" plugins
call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'vim-scripts/AutoComplPop'
	Plug 'vim-airline/vim-airline'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'
	if has('nvim')
	    Plug 'neovim/nvim-lspconfig'
	    Plug 'nvim-lua/plenary.nvim'
	    Plug 'nvim-telescope/telescope.nvim'
	    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	    Plug 'danilo-augusto/vim-afterglow'
	endif
call plug#end()

" NERDtree options
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

syntax enable
colorscheme afterglow

" maps
imap jk <Esc>
nmap <C-s> :w<cr>
nmap <F9> :w<cr>:!pipenv run python3 %<cr>

" disables arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Telescope shortcuts
nnoremap ff :Telescope find_files<cr>
nnoremap fg :Telescope live_grep<cr>
nnoremap fb :Telescope buffers<cr>
nnoremap fh :Telescope help_tags<cr>

" Vim Airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
