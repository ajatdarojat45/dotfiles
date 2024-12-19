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
opt.list = true           -- Show some invisible characters (tabs...
opt.relativenumber = true -- Relative line numbers
opt.wrap = false          -- Disable line wrap
opt.signcolumn = "yes"
opt.guicursor = "a:block"
opt.mouse = ""
opt.directory = '/tmp'
opt.swapfile = false

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

-- Key mappings
api.nvim_set_keymap('n', '<leader>bd', ':%bd<CR>', { noremap = true, silent = true }) -- Close buffer without saving
api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })            -- Exit insert mode
api.nvim_set_keymap('n', 'o', 'o<Esc>', { noremap = true, silent = true })            -- Open a new line below
api.nvim_set_keymap('n', 'O', 'O<Esc>', { noremap = true, silent = true })            -- Open a new line above

-- Insert 
local opts = { noremap = true, silent = true }
api.nvim_set_keymap("n", "is", "I", opts) -- insert in the begining of line
api.nvim_set_keymap("n", "ie", "A", opts) -- insert in the end of line
api.nvim_set_keymap("n", "in", "a", opts) -- insert in the next cursor
api.nvim_set_keymap("n", "iw", "ea", opts) -- insert in the next word

-- Delete
api.nvim_set_keymap('n', '<leader>dd', ':%d<CR>', { noremap = true, silent = true }) -- Delete whole file
api.nvim_set_keymap('n', 'D', '0d$', { noremap = true, silent = true })              -- Delete whole line
api.nvim_set_keymap('n', 'de', 'd$', { noremap = true, silent = true })              -- Delete from cursor to the end of the line
api.nvim_set_keymap('n', 'ds', 'd0', { noremap = true, silent = true })              -- Delete from cursor to the start of the line

-- yank
api.nvim_set_keymap('n', '<leader>yy', ':%y<CR>', { noremap = true, silent = true }) -- Yank whole file
api.nvim_set_keymap('n', 'Y', 'Y$', { noremap = true, silent = true })               -- Yank whole line
api.nvim_set_keymap('n', 'ye', 'y$', { noremap = true, silent = true })              -- Yank from cursor to the end of the line
api.nvim_set_keymap('n', 'ys', 'y0', { noremap = true, silent = true })              -- Yank from cursor to the start of the line

-- Visual mode indentation
api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true }) -- Unindent selected textsett
api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true }) -- Indent selected text

-- Save and Quit
api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })                            -- Save file
api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })                            -- Quit file
api.nvim_set_keymap('n', '<leader>wq', ':wq<CR>', { noremap = true, silent = true })                          -- Save and quit
api.nvim_set_keymap('n', '<leader>qq', ':qa!<CR>', { noremap = true, silent = true })                         -- Quit all
api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true }) -- Format file
-- api.nvim_set_keymap('n', '<leader>s', '<cmd>lua vim.lsp.buf.format()<CR> | :w<CR>', { noremap = true, silent = true }) -- Format and save using lsp                                                  -- Format and save file
api.nvim_set_keymap('n', '<leader>s', ':lua vim.cmd("Prettier") vim.cmd("w")<CR>', { noremap = true, silent = true })

-- Search
api.nvim_set_keymap('n', '<leader>/', '/<CR>', { noremap = true, silent = false }) -- Start forward search
api.nvim_set_keymap('n', '<leader>?', '?<CR>', { noremap = true, silent = false }) -- Start reverse search
api.nvim_set_keymap('n', '<leader>n', 'n', { noremap = true, silent = true })      -- Next search result
api.nvim_set_keymap('n', '<leader>N', 'N', { noremap = true, silent = true })      -- Previous search result

-- Undo/Redo
api.nvim_set_keymap('n', '<leader>u', 'u', { noremap = true, silent = true })     -- Undo
api.nvim_set_keymap('n', '<leader>r', '<C-r>', { noremap = true, silent = true }) -- Redo

-- bufferline
api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true })                          -- Go to previous buffer
api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true })                              -- Go to next buffer
api.nvim_set_keymap('n', '<S-k>', ':bfirst<CR>', { noremap = true, silent = true })                             -- Go to first buffer
api.nvim_set_keymap('n', '<S-j>', ':blast<CR>', { noremap = true, silent = true })                              -- Go to last buffer
--vim.api.nvim_set_keymap('n', '<S-r>', ':bdelete<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<S-r>', ':lua vim.api.nvim_buf_delete(0, {})<CR>', { noremap = true, silent = true }) -- Remove buffer

-- Pencarian yang Lebih Cepat
api.nvim_set_keymap('n', '<leader>/', ':noh<CR>', { noremap = true, silent = true }) -- Hapus highlight pencarian
api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })            -- Pencarian berikutnya dan posisikan di tengah
api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })            -- Pencarian sebelumnya dan posisikan di tengah

-- Pindah Ke Awal/Akhir Baris
api.nvim_set_keymap('n', '<leader>h', '^', { noremap = true, silent = true })  -- Pindah ke awal baris
api.nvim_set_keymap('n', '<leader>l', 'g_', { noremap = true, silent = true }) -- Pindah ke akhir baris

-- Fold
api.nvim_set_keymap('n', 'zc', 'zc', { noremap = true, silent = true }) -- Tutup fold
api.nvim_set_keymap('n', 'zo', 'zo', { noremap = true, silent = true }) -- Buka fold
api.nvim_set_keymap('n', 'zM', 'zM', { noremap = true, silent = true }) -- Tutup semua fold
api.nvim_set_keymap('n', 'zR', 'zR', { noremap = true, silent = true }) -- Buka semua fold
api.nvim_set_keymap('n', 'za', 'za', { noremap = true, silent = true }) -- Toggle fold

-- Markdown Preview
api.nvim_set_keymap('n', 'mp', ':MarkdownPreview<CR>', { noremap = true, silent = true })

-- lazygit
api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
