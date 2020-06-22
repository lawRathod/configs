"automated installation of vimplug if not installed
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


"fzf""""""""""""""""""""""""""""""""""""""""""""""'''

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

map ; :Files<CR>

"polyglot""""""""""""""""""""""""""""""""""""""""""""
Plug 'sheerun/vim-polyglot'
syntax on

"auto-pair""""""""""""""""""""""""""""""""""""""""""'
Plug 'jiangmiao/auto-pairs'

"airline""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nord'
"nerd commentor""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdcommenter'

"devicons""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ryanoasis/vim-devicons'
"gitgutter""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'

"nerdtree""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdtree'
"colorschemes""""""""""""""""""""""""""""""""""""""""""""
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
let ayucolor="light" 


Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

set termguicolors    
"let ayucolor="mirage"
"let ayucolor="dark"  



call plug#end()

"bindings""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
inoremap jj <ESC>
noremap <C-n> :NERDTreeToggle<CR>

"miscellaneous""""""""""""""""""""""""""""""""""""""""""""""



set relativenumber
colorscheme nord
