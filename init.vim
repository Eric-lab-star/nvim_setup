let g:sql_typ_default = 'pgsql'
:set autochdir
set termguicolors            " 24 bit color
:set completeopt-=preview " For No Previews
:set nowrap
:set nocompatible
:set conceallevel=2
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

"Commands 
filetype plugin on
syntax on
augroup filetype
  au! BufRead,BufNewFile *.swift set ft=swift
augroup END
autocmd Filetype c,cpp ClangFormatAutoEnable
autocmd FileType sql setlocal commentstring=--%s
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
command! -nargs=0 SqlFormat :CocCommand sql.Format
command! -nargs=1 WikiLink :lua require("tools").setup(<f-args>)
autocmd ColorScheme * highlight CocHighlightText     ctermfg=Magenta guifg=Magenta

"Plugins 
call plug#begin()
Plug 'ray-x/go.nvim'
Plug 'chentoast/marks.nvim'
Plug 'rafamadriz/friendly-snippets'
Plug 'dart-lang/dart-vim-plugin'
Plug 'nvim-telescope/telescope-file-browser.nvim'
" Plug 'romgrk/barbar.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'wakatime/vim-wakatime'
Plug 'https://github.com/kana/vim-operator-user'
Plug 'https://github.com/rhysd/vim-clang-format'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/guihua.lua' 
" Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'stevearc/dressing.nvim'
Plug 'ziontee113/icon-picker.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'
Plug 'https://github.com/preservim/tagbar'
Plug 'nvim-lua/plenary.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'akinsho/flutter-tools.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-lualine/lualine.nvim'
Plug 'https://github.com/tpope/vim-dadbod'
Plug 'https://github.com/kristijanhusak/vim-dadbod-ui'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
Plug 'https://github.com/kylechui/nvim-surround'
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular' "for alignment :Tabularize
Plug 'm00qek/baleia.nvim', { 'tag': 'v1.3.0' }
Plug 'https://github.com/folke/tokyonight.nvim'
Plug 'tokorom/vim-swift-format'
Plug 'https://github.com/ggandor/leap.nvim'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'mhartington/formatter.nvim'
Plug 'williamboman/mason.nvim'
Plug 'Pocco81/HighStr.nvim'
" Plug 'dense-analysis/ale'
call plug#end()


"for DBUI
let g:dbs =[
\ {'name': 'dev', 'url': 'postgres://kyungsubkim@localhost:5432/kyungsubkim'},
\]
" cutom keymap
" align with =
nmap <Leader>a= :Tabularize /=<CR> 
vmap <Leader>a= :Tabularize /=<CR>
"align with :
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
"align with //
vmap <Leader>a/ :Tabularize /\/\/<CR>
nmap <Leader>a/ :Tabularize /\/\/<CR>

:lua require('init')
