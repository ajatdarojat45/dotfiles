-----------------------------------------------------------
-- Aliases
-----------------------------------------------------------
local opt = vim.opt
local g = vim.g
local keymap = vim.keymap

-----------------------------------------------------------
-- General Options
-----------------------------------------------------------
opt.clipboard = "unnamedplus"
opt.confirm = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.shiftround = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"

opt.termguicolors = true
opt.showmode = false
opt.laststatus = 3 -- global statusline (recommended with lualine)

opt.ignorecase = true
opt.smartindent = true

opt.splitbelow = true
opt.splitright = true

opt.wrap = true
opt.linebreak = true
opt.breakindent = true

opt.pumblend = 10
opt.pumheight = 10
opt.completeopt = "menu,menuone,noselect"

opt.undofile = true
opt.undolevels = 10000

opt.mouse = ""
opt.swapfile = false
opt.directory = "/tmp"

-----------------------------------------------------------
-- Folding (Treesitter)
-----------------------------------------------------------
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldnestmax = 3

-----------------------------------------------------------
-- Globals
-----------------------------------------------------------
g.mapleader = " "
g.markdown_recommended_style = 0

-- Disable unused providers
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

-- Disable netrw (using nvim-tree)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------
local opts = { silent = true }

-- Insert
keymap.set("i", "jj", "<Esc>", opts)

-- Line operations
keymap.set("n", "o", "o<Esc>", opts)
keymap.set("n", "O", "O<Esc>", opts)

-- Buffers
keymap.set("n", "<leader>bd", ":%bd<CR>", opts)
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", opts)
keymap.set("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap.set("n", "<S-k>", "<cmd>bfirst<CR>", opts)
keymap.set("n", "<S-j>", "<cmd>blast<CR>", opts)
keymap.set("n", "<S-r>", function()
	vim.api.nvim_buf_delete(0, {})
end, opts)

-- Delete
keymap.set("n", "<leader>dd", ":%d<CR>", opts)
keymap.set("n", "ds", "d0", opts)

-- Yank
keymap.set("n", "<leader>yy", ":%y<CR>", opts)
keymap.set("n", "ys", "y0", opts)
keymap.set("v", "<leader>p", '"_dP', opts)
keymap.set("v", "<leader>y", '"+y', opts)
keymap.set("n", "<leader>y", '"+y', opts)
keymap.set("n", "<leader>Y", 'gg"+yG', opts)

-- Visual indent & move
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Save / Quit
keymap.set("n", "<leader>w", "<cmd>w<CR>", opts)
keymap.set("n", "<leader>q", "<cmd>q<CR>", opts)
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", opts)
keymap.set("n", "<leader>qq", "<cmd>qa!<CR>", opts)
keymap.set("n", "<leader>s", "<cmd>w!<CR>", opts)

-- Format (canonical formatter)
keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })

-- Search
keymap.set("n", "<leader>/", "<cmd>noh<CR>", opts)
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- Line navigation
keymap.set("n", "<leader>h", "^", opts)
keymap.set("n", "<leader>l", "g_", opts)

-- Folding
keymap.set("n", "zc", "zc", opts)
keymap.set("n", "zo", "zo", opts)
keymap.set("n", "zM", "zM", opts)
keymap.set("n", "zR", "zR", opts)
keymap.set("n", "za", "za", opts)

-- Markdown Preview
keymap.set("n", "mp", "<cmd>MarkdownPreview<CR>", opts)

-- Lazygit
keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)
