local actions = require("telescope.actions")
local api = vim.api

-- Function to integrate Flash.nvim with Telescope
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
    mappings = {
      i = {
        ["<S-q>"] = actions.close,
        ['<S-d>'] = actions.delete_buffer,
        ["<C-s>"] = flash, -- Flash.nvim for insert mode
      },
      n = {
        ["<S-q>"] = actions.close,
        ['<S-d>'] = actions.delete_buffer,
        ["s"] = flash, -- Flash.nvim for normal mode
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown"
    },
    live_grep = {
      theme = "dropdown"
    },
    buffers = {
      theme = "dropdown"
    }
  }
})

-- telescope
api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
