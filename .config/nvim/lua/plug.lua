
vim.cmd([[
  call plug#begin('~/.config/nvim/plugged')

  " Syntax Highlighting dan Parsing
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'windwp/nvim-ts-autotag'
  Plug 'mustache/vim-mustache-handlebars'

  " Autocomplete & LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'onsails/lspkind.nvim'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'

  " Code Formatting dan Linting
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'MunifTanjim/prettier.nvim'

  " Navigasi dan Pencarian
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }
  Plug 'folke/flash.nvim'

  " Manajemen Buffer & Tab
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
  Plug 'nvim-tree/nvim-tree.lua'

  " Git Integration
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'kdheepak/lazygit.nvim'

  " Productivity Enhancements
  Plug 'wakatime/vim-wakatime'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown' }
  Plug 'numToStr/Comment.nvim'
  Plug 'folke/todo-comments.nvim'
  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

  " UI & Tampilan
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'ayu-theme/ayu-vim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'valloric/vim-indent-guides'
  Plug 'goolord/alpha-nvim'
  Plug 'f-person/auto-dark-mode.nvim'

  " Bracket & Delimiter Management
  Plug 'raimondi/delimitmate'

  call plug#end()
]])
