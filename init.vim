:set rtp+=/usr/local/opt/fzf
:set ignorecase
:set termguicolors            " 24 bit color
:set incsearch
:set completeopt-=preview " For No Previews
:set nocompatible
:set number
:set nobackup
:set nowb
:set noswapfile
:set relativenumber
:set smarttab
:set mouse=a
:set clipboard=unnamed
:set encoding=UTF-8
:set inccommand=split
:set shada=<1000,'50,f0,n~/.config/nvim/shada

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4


filetype plugin on
syntax on
augroup filetype
  au! BufRead,BufNewFile *.swift set ft=swift
augroup END
autocmd FileType sql setlocal commentstring=--%s



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'rafamadriz/friendly-snippets'
Plug 'dart-lang/dart-vim-plugin'
Plug 'lewis6991/gitsigns.nvim'
Plug 'https://github.com/kana/vim-operator-user'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/guihua.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'numToStr/Comment.nvim'
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'stevearc/dressing.nvim'
Plug 'ziontee113/icon-picker.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'
Plug 'nvim-lua/plenary.nvim'
"" cmp ""
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lua'

Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'akinsho/flutter-tools.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-lualine/lualine.nvim'
Plug 'https://github.com/tpope/vim-dadbod'
Plug 'https://github.com/kristijanhusak/vim-dadbod-ui'
Plug 'https://github.com/kylechui/nvim-surround'
Plug 'm00qek/baleia.nvim', { 'tag': 'v1.3.0' }
Plug 'https://github.com/folke/tokyonight.nvim'
Plug 'tokorom/vim-swift-format'
Plug 'https://github.com/tpope/vim-repeat' " repeat plugin command
Plug 'mhartington/formatter.nvim' "integrated formatter for many languages
Plug 'https://github.com/mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'https://github.com/nvim-telescope/telescope-dap.nvim'
Plug 'edolphin-ydf/goimpl.nvim',
Plug 'stevearc/oil.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'kkharji/sqlite.lua'
Plug 'AckslD/nvim-neoclip.lua',
Plug 'ryanmsnyder/toggleterm-manager.nvim',
Plug 'nvim-neotest/nvim-nio'
Plug 'folke/todo-comments.nvim'
Plug 'chentoast/marks.nvim'
Plug 'zbirenbaum/copilot.lua'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }
Plug 'github/copilot.vim'
Plug 'keaising/im-select.nvim'
Plug 'kevinhwang91/promise-async'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'mfussenegger/nvim-jdtls'
Plug 'benfowler/telescope-luasnip.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'https://github.com/ggandor/leap.nvim'
Plug 'folke/flash.nvim'
Plug 'https://github.com/folke/persistence.nvim'

"""""Markdown plugins"""""""""
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' } " Markdown Preview in Browser
"""wakatime
Plug 'wakatime/vim-wakatime'
"""tab align"""
Plug 'https://github.com/godlygeek/tabular'
"""Barbar"""
Plug 'romgrk/barbar.nvim'
"" lua ls"""
Plug 'folke/lazydev.nvim'

"""Startup"""
Plug 'startup-nvim/startup.nvim'

"""Project"""
Plug 'ahmedkhalf/project.nvim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""key bindings""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


:lua require('init')

