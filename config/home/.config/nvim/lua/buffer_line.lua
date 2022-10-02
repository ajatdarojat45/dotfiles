vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
      indicator = {
        style = 'underline',
      },
      diagnostics = 'coc',
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end
    },
}
