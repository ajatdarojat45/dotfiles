vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
      indicator = {
        style = 'underline',
      },
      hover= {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
      diagnostics = 'coc',
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end
    },
}
