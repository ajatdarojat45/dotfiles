local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Buffer management
keymap.set("n", "<leader>bd", ":%bd<CR>", opts) -- Close all buffers

-- Insert mode
keymap.set("i", "jj", "<Esc>", opts) -- Exit insert mode

-- Line operations
keymap.set("n", "o", "o<Esc>", opts) -- Open a new line below
keymap.set("n", "O", "O<Esc>", opts) -- Open a new line above

-- Delete
keymap.set("n", "<leader>dd", ":%d<CR>", opts) -- Delete whole file
keymap.set("n", "ds", "d0", opts)              -- Delete from cursor to start of line

-- Yank/Copy
keymap.set("n", "<leader>yy", ":%y<CR>", opts)  -- Yank whole file
keymap.set("n", "ys", "y0", opts)               -- Yank from cursor to start of line
keymap.set("v", "<leader>p", '"_dP', opts)      -- Replace without overwriting clipboard
keymap.set("v", "<leader>y", '"+y', opts)       -- Copy to system clipboard
keymap.set("n", "<leader>y", '"+y', opts)       -- Copy to system clipboard
keymap.set("n", "<leader>Y", 'gg"+yG', opts)    -- Copy entire file to system clipboard

-- Visual mode indentation
keymap.set("v", "<", "<gv", opts) -- Unindent
keymap.set("v", ">", ">gv", opts) -- Indent

-- Move lines in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- Move line down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- Move line up

-- Save and Quit
keymap.set("n", "<leader>w", ":w<CR>", opts)   -- Save file
keymap.set("n", "<leader>q", ":q<CR>", opts)   -- Quit file
keymap.set("n", "<leader>wq", ":wq<CR>", opts) -- Save and quit
keymap.set("n", "<leader>qq", ":qa!<CR>", opts) -- Quit all

-- Formatting
keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts) -- Format file
keymap.set("n", "<leader>sf", ':lua vim.cmd("Prettier") vim.cmd("w")<CR>', opts) -- Format with Prettier and save
keymap.set("n", "<leader>s", ":w!<CR>", opts) -- Save file

-- Search
keymap.set("n", "<leader>/", ":noh<CR>", opts) -- Clear search highlight
keymap.set("n", "n", "nzzzv", opts)            -- Next search result (centered)
keymap.set("n", "N", "Nzzzv", opts)            -- Previous search result (centered)

-- Undo/Redo
keymap.set("n", "u", "u", opts)     -- Undo
keymap.set("n", "r", "<C-r>", opts) -- Redo

-- Buffer navigation
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)                     -- Previous buffer
keymap.set("n", "<S-l>", ":bnext<CR>", opts)                         -- Next buffer
keymap.set("n", "<S-k>", ":bfirst<CR>", opts)                        -- First buffer
keymap.set("n", "<S-j>", ":blast<CR>", opts)                         -- Last buffer
keymap.set("n", "<S-r>", ":lua vim.api.nvim_buf_delete(0, {})<CR>", opts) -- Remove buffer

-- Navigation
keymap.set("n", "<leader>h", "^", opts)  -- Move to start of line
keymap.set("n", "<leader>l", "g_", opts) -- Move to end of line

-- Folding
keymap.set("n", "zc", "zc", opts) -- Close fold
keymap.set("n", "zo", "zo", opts) -- Open fold
keymap.set("n", "zM", "zM", opts) -- Close all folds
keymap.set("n", "zR", "zR", opts) -- Open all folds
keymap.set("n", "za", "za", opts) -- Toggle fold

-- Markdown Preview
keymap.set("n", "mp", ":MarkdownPreview<CR>", opts)

-- LazyGit
keymap.set("n", "<leader>gg", ":LazyGit<CR>", opts)
