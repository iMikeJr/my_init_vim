syntax enable
set rtp+=~/tabnine-vim "ruta del programa de autocompletado, tabnine
set encoding=utf-8 
set noerrorbells "evitamos sonidos raros
set hidden
set magic "para las regulares expresiones, magía on :))"
set mouse=i "activa el soporte para poder usar el mouse bajo ciertas situaciones
set nohls "odio mucho esta opcion activada
set incsearch
set nolist "no muestra en pantalla los caracteres invisibles
set noet "las tabulaciones no se conviertenen en espacios"
set tabstop=4 "Numero de espacios que representa una tabulación o número de columnas de espacios en blanco que equivale el caracter \t <tab>
set sw=2  "equivale al numero de columnas en blanco que vale cada "nivel de identación
set nosmarttab "inserta tabs al inicio de la linea de acuerdo a "set softapstop, no de acuerdo a shiftwidth
set softtabstop=2 "Número de espacios que inserta por una tabulación (insert mode), un valor por defecto establece el numero de columnas en blanco que son desplazadas
set autoindent "automaticamente coloca la indentación en una linea nueva
set smartindent "identacion inteligente para lenguajes de programación
set relativenumber "Numeros relativos, muy bonitos:)
set nu "te muestra en la barra lateral izquierda en que número de linea estás
set guicursor= "coloca la cajita en vez del cursor delgado, me gusta más así.
set signcolumn=yes
set nowrap  "permite extendernos todo el texto que queramos sobre una misma linea, no existen limitaciones
set smartcase "sensible a mayúsculas y minúsculas
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamed
set showcmd
set termguicolors "Usamos colores más lindos jsjs.
set cmdheight=2 "un tamaño considerable para que se muestren posibles errores en la terminal
set scrolloff=8 "note que conserva 8 lineas en el borde inferior de la pantalla, cerca de la linea de estado (line status)
set laststatus=2 "simplemente la linea de status, la de hasta abajo, con este numero siempre se muestra

"chars, just for fun. :set list (opcional)
set listchars=tab:→\ ,eol:↲
filetype indent plugin on
"highlight ColorColumn ctermbg=0 guibg=lightgrey"
"
"--------------------------------------------PLUGINS---------------------------------------------------------------------"
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
"Plug 'neoclide/coc.nvim',{'branch':'release'}

"Plug para R
 Plug 'wsdjeg/Nvim-R'
 Plug 'ncm2/ncm2'
 Plug 'ncm2/ncm2-bufword'
 Plug 'ncm2/ncm2-path'
 Plug 'ncm2/ncm2-jedi'
 Plug 'roxma/nvim-yarp'
 Plug 'gaalcaras/ncm-R'
 Plug 'Raimondi/delimitMate'

 "Autocompletition
"" Plug 'ncm2/ncm2-pyclang'
call plug#end()

colorscheme gruvbox
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog=0
"--------------------------------------------PLUGINS---------------------------------------------------------------------"
"
"---------------------------------------ASPECTOS VISUALES----------------------------------------------------------------
"automatizamos que en cada entrada vim desaparezca el la linea superior e
"inferior del airline
"autocmd VimEnter * hi airline_c  ctermbg=NONE guibg=NONE
"autocmd VimEnter * hi airline_tabfill ctermbg=NONE guibg=NONE
"autocmd VimEnter * hi Normal ctermbg=NONE  guibg=NONE
set background=dark
let g:gruvbox_invert_tabline=1
let g:gruvbox_transparent_bg=1
let g:gruvbox_contrast_dark = 'dark'
let g:airline_theme='minimalist'

"colorear la terminal de gnome
if $COLORTERM =='gnome-terminal'
  set t_Co=256
endif
"
"-------------------------------------------------------------------------------------------------------------------------
"
let NERDTreeQuitOnOpen=1
" -------------------------------------MAPEOS------------------------------------------------------------------------------
let mapleader=" "

nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source %<CR>

"Inutilizamos las flechas del teclado en modo normal
nnoremap<up> <nop>
nnoremap<down> <nop>
nnoremap<left> <nop>
nnoremap<right> <nop>

"Permiten ajustar el tamaño de los bufferes en modo horizontal y vertical
nnoremap <silent> <right> :vertical resize +5<CR> 
nnoremap <silent> <left> :vertical resize -5<CR> 
nnoremap <silent> <up> : resize +5<CR> 
nnoremap <silent> <down> : resize -5<CR> 

"Los siguientes mapeos son para abrir la terminal de manera rápida
vnoremap <c-t> :split<CR>:below terminal<CR>
nnoremap <c-t> :vertical split<CR>:botright vertical terminal<CR>
"Mapeo para salir del modo terminal, considera que es importante
tnoremap <Esc> <C-\><C-n>

"mapeos prácticos
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e $MYVIMRC<CR>
nnoremap <Leader>qq :q!<CR>
nnoremap <Leader>p :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

"Easy motion maps
nmap <Leader>s <Plug>(easymotion-s2)

"Nerdtree
nmap <Leader>nt :NERDTreeFind<CR>

"Mapeos de búfer
nnoremap <Leader>k :bnext <CR>
nnoremap <Leader>j :bprevious <CR>
nnoremap <Leader>q :bdelete<CR>

"split  de la ventana actual, horizontal y vertical
nnoremap <Leader>vs :vsp <CR>
nnoremap <Leader>sp :sp <CR>


"Configuraciones demasiado importantes para la terminal integrada de neovim
"para más información checa la siguiente liga:
"	link: http://neovim.io/doc/user/nvim_terminal_emulator.html
"
augroup custom_term
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber bufhidden=hide scrolloff=0 sidescrolloff=0 nocursorcolumn nocursorline
  "¡IMPORTANTE! Muy bien, dí con el clavo sobre el problema visual de la
  "terminal externa de neovim, la cuestión es que hay que colocar scrolloff=0
  "para solucionar este problema. Si no recuerdas de lo que estoy hablando
  "(que es lo más posible), solo varia el parámetro scrolloff para que veas
  "que sucede.
  "
  "Además nota las demás configuracione locales (setlocal), son igual de
  "importantes como lo que notaste con scrolloff=0
augroup END

"NCM2
autocmd BufEnter * call ncm2#enable_for_buffer() "Para habilitar ncm2 completition para todos los buffers
set completeopt=noinsert,menuone,noselect
"au BufReadPost * if line("\'") >1 && line("\'") <= line("$") | exe "normal! g'\"" | endif

"-------------------------------------MAPEOS------------------------------------------------------------------------------
"
"-------------------------------------AIRLINE SYMBOLS----------------------------------------------------
 set t_Co=256
 if !exists('g:airline_symbols')
   let g:airline_symbols = {}
 endif
 let g:airline_powerline_fonts=1
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#formatter = 'jsformatter'
 " u icode symbols
 let g:airline_left_sep = '»'
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
 let g:airline_symbols.linen4r = ' :'
 let g:airline_symbols.maxlinenr = '☰ '
 let g:airline_symbols.dirty='⚡'
"_-------------------------------------------------------------
"
