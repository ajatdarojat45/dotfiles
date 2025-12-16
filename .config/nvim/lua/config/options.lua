local opt = vim.opt
local g = vim.g

opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.confirm = true            -- Confirm to save changes before exiting modified buffer
opt.expandtab = true          -- Use spaces instead of tabs
opt.laststatus = 0            -- Dont show status bar since we have a lualine
opt.showmode = false          -- Dont show mode since we have a lualine
opt.number = true             -- Print line number
opt.pumblend = 10             -- Popup blend
opt.pumheight = 10            -- Maximum number of entries in a popup
opt.shiftround = true         -- Round indent
opt.shiftwidth = 2            -- Size of an indent
opt.tabstop = 2               -- Number of spaces tabs count for
opt.undofile = true
opt.undolevels = 10000
opt.termguicolors = true  -- True color support
opt.smartindent = true    -- Insert indents automatically
opt.splitbelow = true     -- Put new windows below current
opt.splitright = true     -- Put new windows right of current
opt.completeopt = "menu,menuone,noselect,preview"
opt.cursorline = true     -- Enable highlighting of the current line
opt.ignorecase = true     -- Ignore case
opt.list = false          -- Show some invisible characters
opt.relativenumber = true -- Relative line numbers
opt.wrap = true           -- Enable line wrap
opt.linebreak = true      -- Wrap at word boundaries, not mid-word
opt.breakindent = true    -- Indent wrapped lines to match line start
opt.signcolumn = "yes"
opt.guicursor = "n-v-c-sm:block,i-ci-ve:block-blinkon1,r-cr-o:block"
opt.mouse = ""
opt.directory = "/tmp"
opt.swapfile = false

-- Enable folding
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldnestmax = 3

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

-- Disable providers
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Leader key
g.mapleader = " "
g.maplocalleader = " "
