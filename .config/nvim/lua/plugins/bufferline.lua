--local api = vim.api
--require("bufferline").setup {}

require("bufferline").setup {
  options = {
    mode = "buffers",
    indicator = {
      icon = '▎',
      style = 'underline',
    },
    close_icon = '✗',
    buffer_close_icon = '✗',
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end

  },
  highlights = {
    buffer_selected = {
      fg = '#73aaf9',
    },
  }
}
