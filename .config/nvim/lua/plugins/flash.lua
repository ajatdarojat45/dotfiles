return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fl",
      function()
        require("flash").jump({ search = { forward = true, wrap = false, multi_window = false } })
      end,
      desc = "Flash forward search",
    },
    {
      "<leader>?",
      function()
        require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } })
      end,
      desc = "Flash reverse search",
    },
  },
  config = function()
    require("flash").setup({
      modes = {
        search = {
          highlight = { backdrop = true },
        },
        char = {
          jump_labels = true,
        },
      },
    })
  end,
}
