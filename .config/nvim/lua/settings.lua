local opt = vim.opt
local g = vim.g
local api = vim.api

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
opt.termguicolors = true  -- True color support, used by lualine, nvim-tree, telescope, and many plugins
opt.smartindent = true    -- Insert indents automatically
opt.splitbelow = true     -- Put new windows below current
opt.splitright = true     -- Put new windows right of current
opt.completeopt = "menu,menuone,noselect,preview"
opt.cursorline = true     -- Enable highlighting of the current line
opt.ignorecase = true     -- Ignore case
opt.list = false          -- Show some invisible characters (tabs...
opt.relativenumber = true -- Relative line numbers
opt.wrap = true           -- Disable line wrap
opt.linebreak = true      -- Wrap at word boundaries, not mid-word
opt.breakindent = true    -- Indent wrapped lines to match line start
--opt.showbreak = '↪ ' -- Show this prefix on wrapped lines (optional)
opt.signcolumn = "yes"
opt.guicursor = "n-v-c-sm:block,i-ci-ve:block-blinkon1,r-cr-o:block"
opt.mouse = ""
opt.directory = '/tmp'
opt.swapfile = false
--opt.scrolloff = 8

-- Enable folding
opt.foldenable = true                       -- Aktifkan folding
opt.foldmethod = 'expr'                     -- Gunakan metode expr untuk folding
opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Gunakan Treesitter untuk folding

-- Default settings
opt.foldlevel = 99      -- Buka semua fold secara default
opt.foldlevelstart = 99 -- Mulai dengan semua fold terbuka
opt.foldnestmax = 3     -- Maksimal nesting fold

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.mapleader = " "

local opts = { noremap = true, silent = true }
-- Key mappings
api.nvim_set_keymap('n', '<leader>bd', ':%bd<CR>', opts) -- Close buffer without saving
api.nvim_set_keymap('i', 'jj', '<Esc>', opts)            -- Exit insert mode
api.nvim_set_keymap('n', 'o', 'o<Esc>', opts)            -- Open a new line below
api.nvim_set_keymap('n', 'O', 'O<Esc>', opts)            -- Open a new line above

-- Delete
api.nvim_set_keymap('n', '<leader>dd', ':%d<CR>', opts) -- Delete whole file
api.nvim_set_keymap('n', 'ds', 'd0', opts)              -- Delete from cursor to the start of the line

-- yank
api.nvim_set_keymap('n', '<leader>yy', ':%y<CR>', opts) -- Yank whole file
api.nvim_set_keymap('n', 'ys', 'y0', opts)              -- Yank from cursor to the start of the line
api.nvim_set_keymap('v', '<leader>p', '"_dP', opts)     -- Replace selected text with clipboard content without overwriting clipboard
api.nvim_set_keymap('v', '<leader>y', '"+y', opts)      -- Copy selected text to the system clipboard
api.nvim_set_keymap('n', '<leader>y', '"+y', opts)      -- Copy current line or specified text range to the system clipboard
api.nvim_set_keymap('n', '<leader>Y', 'gg"+yG', opts)   -- Copy the entire file content to the system clipboard


-- Visual mode indentation
api.nvim_set_keymap('v', '<', '<gv', opts) -- Unindent selected textsett
api.nvim_set_keymap('v', '>', '>gv', opts) -- Indent selected text
api.nvim_set_keymap(
  "v",                                     -- Mode: Visual
  "J",                                     -- Key to map
  ":m '>+1<CR>gv=gv",                      -- Command to execute
  opts                                     -- Options
)
api.nvim_set_keymap(
  "v",                -- Mode: Visual
  "K",                -- Key to map
  ":m '<-2<CR>gv=gv", -- Command to execute
  opts                -- Options
)

-- Save and Quit
api.nvim_set_keymap('n', '<leader>w', ':w<CR>', opts)                                                                  -- Save file
api.nvim_set_keymap('n', '<leader>q', ':q<CR>', opts)                                                                  -- Quit file
api.nvim_set_keymap('n', '<leader>wq', ':wq<CR>', opts)                                                                -- Save and quit
api.nvim_set_keymap('n', '<leader>qq', ':qa!<CR>', opts)                                                               -- Quit all
api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)                                       -- Format file
api.nvim_set_keymap('n', '<leader>s', '<cmd>lua vim.lsp.buf.format()<CR> | :w<CR>', { noremap = true, silent = true }) -- Format and save using lsp                                                  -- Format and save file
-- api.nvim_set_keymap('n', '<leader>s', ':lua vim.cmd("Prettier") vim.cmd("w")<CR>', opts)

-- Search
api.nvim_set_keymap('n', '<leader>/', '/<CR>', opts) -- Start forward search
api.nvim_set_keymap('n', '<leader>?', '?<CR>', opts) -- Start reverse search
api.nvim_set_keymap('n', '<leader>n', 'n', opts)     -- Next search result
api.nvim_set_keymap('n', '<leader>N', 'N', opts)     -- Previous search result

-- Undo/Redo
api.nvim_set_keymap('n', 'u', 'u', opts)     -- Undo
api.nvim_set_keymap('n', 'r', '<C-r>', opts) -- Redo

-- bufferline
api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', opts)                          -- Go to previous buffer
api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', opts)                              -- Go to next buffer
api.nvim_set_keymap('n', '<S-k>', ':bfirst<CR>', opts)                             -- Go to first buffer
api.nvim_set_keymap('n', '<S-j>', ':blast<CR>', opts)                              -- Go to last buffer
--vim.api.nvim_set_keymap('n', '<S-r>', ':bdelete<CR>', opts)
api.nvim_set_keymap('n', '<S-r>', ':lua vim.api.nvim_buf_delete(0, {})<CR>', opts) -- Remove buffer

-- Pencarian yang Lebih Cepat
api.nvim_set_keymap('n', '<leader>/', ':noh<CR>', opts) -- Hapus highlight pencarian
api.nvim_set_keymap('n', 'n', 'nzzzv', opts)            -- Pencarian berikutnya dan posisikan di tengah
api.nvim_set_keymap('n', 'N', 'Nzzzv', opts)            -- Pencarian sebelumnya dan posisikan di tengah

-- Pindah Ke Awal/Akhir Baris
api.nvim_set_keymap('n', '<leader>h', '^', opts)  -- Pindah ke awal baris
api.nvim_set_keymap('n', '<leader>l', 'g_', opts) -- Pindah ke akhir baris

-- Fold
api.nvim_set_keymap('n', 'zc', 'zc', opts) -- Tutup fold
api.nvim_set_keymap('n', 'zo', 'zo', opts) -- Buka fold
api.nvim_set_keymap('n', 'zM', 'zM', opts) -- Tutup semua fold
api.nvim_set_keymap('n', 'zR', 'zR', opts) -- Buka semua fold
api.nvim_set_keymap('n', 'za', 'za', opts) -- Toggle fold

-- Markdown Preview
api.nvim_set_keymap('n', 'mp', ':MarkdownPreview<CR>', opts)

-- lazygit
api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', opts)
