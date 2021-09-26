                                        "###############################
                                        "#   DanMalop Configuration    #
                                        "###############################
"================================================================================================================================
" configuracion nvim
autocmd InsertEnter,InsertLeave * set cul!
set number     " numeracion de lineas relativa
set rnu
set mouse=a

set clipboard=unnamed
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2

set nolist " no ver caracteres ocultos
set visualbell
filetype off
syntax on
filetype plugin indent on
set modelines=0
set wrap
set scrolloff=5
"set tabstop=4
"set shiftwidth=4
"set expandtab
set ttyfast
set showmode
set showcmd
set nocompatible
	
"Search configs
set hlsearch
set incsearch
set ignorecase
set smartcase

" PLUGINS
"================================================================================================================================
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree' " NERDTree plugin abrelo con , + n + t
Plug 'tpope/vim-fugitive' " Permite usar comandos de git luego de los dos puntos (: comando git)
Plug 'vim-airline/vim-airline' " barra de estado
Plug 'easymotion/vim-easymotion' " se usa para moverse rapidamente por el documento 
Plug 'matze/vim-move' " permite mover de lugar lineas y selecciones de varias lineas
Plug 'voldikss/vim-floaterm' "terminal flotante al pulsar F12

"IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'  "Requiere la instalacion de fzf, bat, the_silver_searcher y ripgrep desde el gestor de paquetes
Plug 'junegunn/fzf.vim' " escribe el comando :Ag para buscar la ubicacion de una variable dentro del proyecto
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Muy bueno, con ctrl+n pone cursores en variables del mismo nombre, una mas cada vez que se escribe el atajo, con ctrl + up/down vacreando cursores en las lineas 
Plug 'mhinz/vim-signify'  "Agrega un signo + o - en las lineas en que se agregó modifico o quitó algo
Plug 'scrooloose/nerdcommenter' "Permite comentar rapidamente con la combinacion Space + cc
Plug 'tpope/vim-repeat' "Permite que la tecla . repita tambien funciones de ciertos plugins

"Resaltado de sintaxis
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine' " pone lineas que muestran cada nivel de indentacion
Plug 'frazrepo/vim-rainbow' " Le da el mismo color a los pares de parentesis
Plug 'lilydjwg/colorizer' " Resaltador de colores hexadecimales
Plug 'tpope/vim-surround' "Permite encerrar texto en parentesis, corchetes etc facilmente

"Language support and autocomplete
Plug 'mattn/emmet-vim' " usa ctrl + z + , luego de una expresion de emmet para generar el codigo html
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocompletado coc
Plug 'pangloss/vim-javascript' " Javascript support
Plug 'leafgarland/typescript-vim' " Typescript support
Plug 'chun-yang/auto-pairs' " autocerrado de parentesis
Plug 'alvan/vim-closetag' "autocerrado de etiquetas


"Color Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim', {'as': 'onedark'} 
Plug 'liuchengxu/space-vim-dark'

call plug#end()
"================================================================================================================================

" Activa el rainbow bracket
let g:rainbow_active = 1

"Configuracion fzf
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

"Floaterm configuration
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_autoclose = 2

"================================================================================================================================
"APARIENCIA
syntax enable
"colorscheme onedark
colorscheme space-vim-dark
let g:space_vim_dark_background = 233
color space-vim-dark
hi Comment guifg=#5C6370 ctermfg=59

"Airline theme
let g:airline_theme= 'deus'

" Activar la fuente powerline
let g:airline_powerline_fonts=1
set guifont=Menlo\ for\ Powerline

"================================================================================================================================
"MAP SHORTCUTS
let mapleader = " "
noremap <leader>gs : CocSearch

map <Enter> o<ESC>
map <S-Enter> O<ESC>

"emmet
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-Z>'
"autocmd VimEnter * NERDTree | wincmd p

"Abrir NERDTree con F5
map <F5> :NERDTreeToggle<CR>

nmap <Leader>s <Plug>(easymotion-s2)

" window split
set splitbelow splitright   
" remapeando la navegacion por las ventanas para que sea con Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" remapeando el resize de las ventanas para  que sea mas sencillo
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
"Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

execute "set <M-j>=\ej"
nnoremap <M-j> j

execute "set <M-k>=\ek"
nnoremap <M-k> k

execute "set <M-h>=\eh"
nnoremap <M-h> h

execute "set <M-l>=\el"     
nnoremap <M-l> l

"Floaterm configuration
let g:floaterm_keymap_toggle = '<F12>'

" Atajos para los plugins
map <Leader>p :Files<CR>
map <Leader>ag :Ag<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Buffers
map <Leader>ob :Buffers<cr>

"Fast scrolling
"nnoremap<C-j> 10<C-e>
"nnoremap<C-k> 10<C-y>
