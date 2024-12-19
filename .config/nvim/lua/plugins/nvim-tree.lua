local api = vim.api

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    --   adaptive_size = true,
    width = 30,
    --    mappings = {
    --     list = {
    --      { key = "u", action = "dir_up" },
    --   },
    --   },
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    }
  },
  filters = {
    dotfiles = false,
  },
})

-- nvim-tree
api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>er', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>ee', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>ef', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
