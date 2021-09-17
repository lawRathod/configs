"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif
call plug#begin('~/.config/nvim/plugged')

"""Plugins

"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"AutoPair
Plug 'windwp/nvim-autopairs'

"Icons
Plug 'kyazdani42/nvim-web-devicons'

"Tabline
Plug 'romgrk/barbar.nvim'

"Cursorline
Plug 'yamatsum/nvim-cursorline'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"LSP
"Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'

"Formatter
Plug 'mhartington/formatter.nvim'

"Auto tab and shiftwidth helper
Plug 'tpope/vim-sleuth'

"Statusline
Plug 'hoob3rt/lualine.nvim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"Colors
Plug 'norcalli/nvim-colorizer.lua'

"Comment Util
Plug 'preservim/nerdcommenter'

"Code Utils
Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'

"Git Util
Plug 'airblade/vim-gitgutter'

"Terminal in nvim
Plug 'numtostr/FTerm.nvim'

"Navigation Panel
Plug 'kyazdani42/nvim-tree.lua'
"Plug 'preservim/nerdtree'


"ColorSchemes
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

call plug#end()

"""Plugin Specific Configs

"Autopair
lua require('nvim-autopairs').setup()

"Colorizer
set termguicolors
lua require'colorizer'.setup()

"LSP
lua << EOF
require 'lsp' 
require 'lspsaga'.init_lsp_saga()
EOF

"Formatter
lua require 'formatter_config'
 
let g:completion_trigger_keyword_length = 3
let g:completion_matching_smart_case = 1
"autocmd BufEnter * if &buftype != "nofile" | lua require'completion'.on_attach()
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
set shortmess+=c
imap <tab> <Plug>(completion_smart_tab)
imap <silent> <c-space> <Plug>(completion_trigger)

"Lualine
lua require 'statusline'

"Fterm
lua <<EOF
require('FTerm').setup()

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

local term = require("FTerm.terminal")
local lazygit = term:new():setup({
    cmd = "lazygit",
})

function _G.__fterm_lazygit()
    lazygit:toggle()
end

map('n', '<leader>g', '<CMD>lua __fterm_lazygit()<CR>', opts)
map('t', '<leader>g', '<CMD>lua __fterm_lazygit()<CR>', opts)

EOF


"Telescope
nnoremap <leader>ff <cmd>Telescope find_files theme=get_dropdown<cr>
nnoremap <leader>fg <cmd>Telescope live_grep theme=get_dropdown<cr>
nnoremap <leader>fb <cmd>Telescope buffers theme=get_dropdown<cr>
nnoremap <leader>fh <cmd>Telescope help_tags theme=get_dropdown<cr>

"Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

"Airline
"let g:airline_powerline_fonts = 1
""let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
""let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
""let g:airline_left_sep = ''
""let g:airline_right_sep = ''
""let g:airline_theme='gruvbox'
"let g:airline_theme='nord'

"Coc
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <silent><expr> <C-space> coc#refresh()
"""""""GoTo code navigation
""nmap <leader>g <C-o>
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gt <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <leader>rn <Plug>(coc-rename)
"nnoremap <silent> K :call CocAction('doHover')<CR>
"nnoremap <silent> do :CocAction<CR>
"""""""show all diagnostics.
"nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"""""""manage extensions.
"nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
"nnoremap <silent> <space>c :<C-u>CocList commands<cr>

""NvimTree
noremap <C-n> :NvimTreeToggle<CR>
let g:nvim_tree_disable_window_picker = 1
""let NERDTreeMinimalUI = 1
""let NERDTreeDirArrows = 1

"""bindings
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <space>f <cmd>FormatWrite<CR>
inoremap jk <ESC>
noremap <S-c> :CocList
autocmd filetype cpp nnoremap <F5> :wa <bar> exec '!clang++ -o solution '.shellescape('%')'; ./solution < testcases > output'<CR>
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype go nnoremap <F4> :w <bar> exec '!go run '.shellescape('%')<CR>
autocmd filetype javascript nnoremap <F4> :w <bar> exec '!node '.shellescape('%')<CR>
autocmd filetype typescript nnoremap <F4> :w <bar> exec '!ts-node '.shellescape('%')<CR>
autocmd filetype java nnoremap <F5> :w <bar> exec '!javac scratch.java; java scratch > output'<CR>
autocmd filetype sh nnoremap <F4> :w <bar> exec '!bash '.shellescape('%')<CR>


"""Cosmetic
colorscheme nord 
"set bg=dark
set termguicolors    
"let ayucolor="mirage"
"let ayucolor="light"  

"""miscellaneous
set relativenumber
set clipboard+=unnamedplus
set autoindent
set smartindent
set mouse=a
set shiftwidth=2
