local api = vim.api

require('flash').setup({
  modes = {
    search = {
      highlight = { backdrop = true }, -- Highlights the search area
    },
    char = {
      jump_labels = true, -- Show labels for character jumps
    },
  },
})

-- Flash.nvim keymaps for search
api.nvim_set_keymap('n', '<leader>/',
  '<cmd>lua require("flash").jump({ search = { forward = true, wrap = false, multi_window = false },})<CR>',
  { noremap = true, silent = true }) -- Start forward search

api.nvim_set_keymap('n', '<leader>?',
  '<cmd>lua require("flash").jump({ search = { forward = false, wrap = false, multi_window = false },})<CR>',
  { noremap = true, silent = true }) -- Start reverse search
