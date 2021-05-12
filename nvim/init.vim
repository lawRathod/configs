"utomated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

"coc""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> do :CocAction<CR>
"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c :<C-u>CocList commands<cr>


Plug 'chrisbra/Colorizer'


Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <space>f; :Files<CR>
nnoremap <silent> <space>; :Files<CR>
nnoremap <silent> <space>b; :Buffers<CR>
let g:fzf_layout = { 'down': '~50%' }


Plug 'sheerun/vim-polyglot'
syntax on


Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_theme='gruvbox'
let g:airline_theme='ayu_dark'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdtree'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


Plug 'drewtempelmeyer/palenight.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
set termguicolors    
"let ayucolor="mirage"
let ayucolor="dark"  
call plug#end()



Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}


"bindings""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
inoremap jk <ESC>
noremap <C-n> :NERDTreeToggle<CR>
noremap <S-c> :CocList

"miscellaneous""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype cpp nnoremap <F5> :wa <bar> exec '!clang++ -o solution '.shellescape('%')'; ./solution < testcases > output'<CR>
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype go nnoremap <F4> :w <bar> exec '!go run '.shellescape('%')<CR>
autocmd filetype javascript nnoremap <F4> :w <bar> exec '!node '.shellescape('%')<CR>
autocmd filetype typescript nnoremap <F4> :w <bar> exec '!ts-node '.shellescape('%')<CR>
autocmd filetype java nnoremap <F5> :w <bar> exec '!javac scratch.java; java scratch > output'<CR>
autocmd filetype sh nnoremap <F4> :w <bar> exec '!bash '.shellescape('%')<CR>

set relativenumber
colorscheme ayu 
set bg=dark
set clipboard+=unnamedplus
set autoindent
set smartindent
set mouse=a
set shiftwidth=2
