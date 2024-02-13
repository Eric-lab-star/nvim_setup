let g:sql_typ_default = 'pgsql'
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_winsize = 30

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
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a
:set clipboard=unnamed
:set encoding=UTF-8

let g:netrw_browsex_viewer = "xdg-open"
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_toc_autofit=1


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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ray-x/go.nvim'
Plug 'rafamadriz/friendly-snippets'
Plug 'dart-lang/dart-vim-plugin'
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
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
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
Plug 'ThePrimeagen/harpoon',{'branch': 'harpoon2'}
Plug 'preservim/vim-markdown'
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()
""""""""" coc snippets

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"outliner using coc.vim
nnoremap <silent><nowait> <space>o  :call ToggleOutline()<CR>
function! ToggleOutline() abort
	let winid = coc#window#find('cocViewId', 'OUTLINE')
	if winid == -1
		call CocActionAsync('showOutline', 1)
	else
		call coc#window#close(winid)
	endif
endfunction

" close outine automatically when no file is open
autocmd BufEnter * call CheckOutline()
function! CheckOutline() abort
	if &filetype ==# 'coctree' && winnr('$') == 1
		if tabpagenr('$') != 1
			close
		else
			bdelete
		endif
	endif
endfunction

"for DBUI
let g:dbs =[
\ {'name': 'dev', 'url': 'postgres://kyungsubkim@localhost:5432/kyungsubkim'},
\]

:lua require('init')
