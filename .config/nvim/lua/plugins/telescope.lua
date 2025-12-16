return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim", "folke/flash.nvim", "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    { "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "Color schemes" },
  },
  config = function()
    local actions = require("telescope.actions")

    local function flash(prompt_bufnr)
      require("flash").jump({
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
          mode = "search",
          exclude = {
            function(win)
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
            end,
          },
        },
        action = function(match)
          local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      })
    end

    require("telescope").setup({
      defaults = {
        layout_config = {
          horizontal = {
            preview_cutoff = 0,
          },
        },
        preview = {
          treesitter = false, -- Disable treesitter highlighting in previews to avoid ft_to_lang errors
        },
        mappings = {
          i = {
            ["<S-q>"] = actions.close,
            ["<S-d>"] = actions.delete_buffer,
            ["<C-s>"] = flash,
          },
          n = {
            ["<S-q>"] = actions.close,
            ["<S-d>"] = actions.delete_buffer,
            ["s"] = flash,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        },
        live_grep = {
          theme = "dropdown",
        },
        buffers = {
          theme = "dropdown",
        },
        colorscheme = {
          enable_preview = true,
          theme = "dropdown",
        },
      },
    })
  end,
}
