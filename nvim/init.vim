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

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c :<C-u>CocList commands<cr>


Plug 'chrisbra/colorizer'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'tpope/vim-sleuth'
Plug 'psliwka/vim-smoothie'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <space>; :Files<CR>


Plug 'sheerun/vim-polyglot'
syntax on


Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='ayu_mirage'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'




Plug 'drewtempelmeyer/palenight.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
let ayucolor="dark" 
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
set termguicolors    
"let ayucolor="mirage"
let ayucolor="dark"  
call plug#end()

"bindings""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
inoremap jj <ESC>
noremap <C-n> :NERDTreeToggle<CR>
tnoremap  jj <ESC>
noremap <S-c> :CocList


"miscellaneous""""""""""""""""""""""""""""""""""""""""""""""

set wrap!
set relativenumber
colorscheme ayu
"set bg=dark
