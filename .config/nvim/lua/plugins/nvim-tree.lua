return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "NvimTree focus" },
    { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "NvimTree refresh" },
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree toggle" },
    { "<leader>ef", "<cmd>NvimTreeFindFile<CR>", desc = "NvimTree find file" },
  },
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            git = true,
          },
        },
      },
      git = {
        enable = true,
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
}
