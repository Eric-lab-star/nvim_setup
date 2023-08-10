
:set number
:set nobackup
:set nowb 
:set noswapfile
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set clipboard=unnamed
:set encoding=UTF-8

autocmd Filetype c,cpp ClangFormatAutoEnable
autocmd FileType sql setlocal commentstring=--%s
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument



" navigation key

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

nnoremap <C-s> :NvimTreeToggle<CR>
call plug#begin()
Plug 'chentoast/marks.nvim'
Plug 'https://github.com/cbochs/grapple.nvim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'romgrk/barbar.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'wakatime/vim-wakatime'
Plug 'ray-x/aurora'
Plug 'https://github.com/kana/vim-operator-user'
Plug 'https://github.com/rhysd/vim-clang-format'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua' 
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/crusj/structrue-go.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'ziontee113/icon-picker.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'https://github.com/folke/noice.nvim'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/nvimdev/dashboard-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'akinsho/flutter-tools.nvim'
Plug 'rcarriga/nvim-notify'
" latest updates
Plug 'nvim-lualine/lualine.nvim'
Plug 'https://github.com/tpope/vim-dadbod'
Plug 'https://github.com/kristijanhusak/vim-dadbod-ui'
call plug#end()

set termguicolors            " 24 bit color
let g:aurora_italic = 1     " italic
let g:aurora_transparent = 1     " transparent
let g:aurora_bold = 1     " bold
let g:aurora_darker = 1     " darker background

colorscheme aurora

" nnoremap <C-s> :NvimTreeToggle<CR>
:set completeopt-=preview " For No Previews

"barbar
nnoremap <silent>    <C-c> <Cmd>BufferClose<CR>
nnoremap <silent>    <C-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <C-.> <Cmd>BufferNext<CR>

:lua require('init')
