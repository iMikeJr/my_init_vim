syntax enable
set encoding=utf-8
set rtp+=~/tabnine-vim
set tabstop=4 sts=2
set sw=4 nosmarttab "won't insert the number of empty rows of sw, instead will insert softapstop
set autoindent smartindent
set signcolumn=yes
set nu rnu "about relative numbers
set incsearch noerrorbells
set showmatch smartcase
set nowrap cursorline
set nohls
"undofiles
set noswapfile nobackup
set undodir=~/.vim/undodir undofile
set clipboard=unnamed
"Important for python
filetype indent plugin on
"colorcolums
highlight ColorColumn ctermbg=0 guibg=lightslategrey
set cmdheight=2 showcmd termguicolors

 call plug#begin('~/.vim/plugged')
 Plug 'morhetz/gruvbox'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'vim-airline/vim-airline'
 Plug 'bling/vim-airline'
 Plug 'tpope/vim-fugitive'
 Plug 'easymotion/vim-easymotion'
 Plug 'scrooloose/nerdtree'
 Plug 'ryanoasis/vim-devicons'
 Plug 'octol/vim-cpp-enhanced-highlight'
 Plug 'christoomey/vim-tmux-navigator'
 call plug#end()

 let g:gruvbox_invert_tabline=1
 let g:gruvbox_transparent_bg=1
 let g:gruvbox_contrast_dark = 'hard'
 colorscheme gruvbox
 set background=dark
 let g:airline_theme='minimalist'
 let NERDTreeQuitOnOpen=1
 "automatizamos que en cada entrada vim desaparezca el la linea superior e
 "inferior del airline
 "autocmd VimEnter * hi airline_c  ctermbg=NONE guibg=NONE
 "autocmd VimEnter * hi airline_tabfill ctermbg=NONE guibg=NONE
 "autocmd VimEnter * hi Normal ctermbg=none guibg=NONE
 "--------------------------------------------------------------------------
 "
 "Mapleader for easymotion

 "atajos
 let mapleader=" "
 nmap <Leader>w :w<CR>
 nmap <Leader>q :q<CR>
 nmap <Leader>r :source %<CR>
 nmap <Leader>s <Plug>(easymotion-s2)
 nmap <Leader>nt :NERDTreeFind<CR>
 map <C-w> :bnext <CR>

"airline----------------------------------------------------
set t_Co=256
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_powerline_fonts=1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'jsformatter' " u icode symbols let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.colnr = ' ㏇:'
  let g:airline_symbols.colnr = ' ℅:'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = ' ␊:'
  let g:airline_symbols.linenr = ' ␤:'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.colnr = ' :'
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ' :'
  let g:airline_symbols.maxlinenr = '☰ '
  let g:airline_symbols.dirty='⚡'





