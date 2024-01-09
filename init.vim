let g:sql_typ_default = 'pgsql'
:set ignorecase
:set termguicolors            " 24 bit color
:set incsearch
:set completeopt-=preview " For No Previews
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

let g:netrw_browsex_viewer = "xdg-open"
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_toc_autofit=1

let g:ale_echo_cursor=0
let g:ale_hover_cursor=0
let g:ale_set_balloons=0

filetype plugin on
syntax on
augroup filetype
  au! BufRead,BufNewFile *.swift set ft=swift
augroup END
autocmd FileType sql setlocal commentstring=--%s
"Commands
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
command! -nargs=0 SqlFormat :CocCommand sql.Format
command! -nargs=1 WL :lua require("tools").setup(<f-args>)
autocmd ColorScheme * highlight CocHighlightText     ctermfg=Magenta guifg=Magenta
"Plugins
call plug#begin()
Plug 'ray-x/go.nvim'
Plug 'chentoast/marks.nvim'
Plug 'rafamadriz/friendly-snippets'
Plug 'dart-lang/dart-vim-plugin'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'https://github.com/kana/vim-operator-user'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/guihua.lua'
Plug 'nvim-tree/nvim-web-devicons'
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
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular' "for alignment :Tabularize
Plug 'm00qek/baleia.nvim', { 'tag': 'v1.3.0' }
Plug 'https://github.com/folke/tokyonight.nvim'
Plug 'tokorom/vim-swift-format'
Plug 'https://github.com/ggandor/leap.nvim'
Plug 'https://github.com/tpope/vim-repeat' " repeat plugin command
Plug 'mhartington/formatter.nvim' "integrated formatter for many languages
Plug 'williamboman/mason.nvim'"lsp downloader
Plug 'dense-analysis/ale'
Plug 'ThePrimeagen/harpoon',{'branch': 'harpoon2'}
Plug 'preservim/vim-markdown'
Plug 'liuchengxu/vista.vim' "viewer and finder for lsp symbols and tags
call plug#end()
""""""""" coc snippets

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"for DBUI
let g:dbs =[
\ {'name': 'dev', 'url': 'postgres://kyungsubkim@localhost:5432/kyungsubkim'},
\]

:lua require('init')
