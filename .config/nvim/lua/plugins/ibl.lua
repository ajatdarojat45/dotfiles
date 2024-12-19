-- indent blankline V2 setup
--vim.opt.list = true
--vim.opt.termguicolors = true

--require("indent-blankline").setup {
--space_char_blankline = " ",
  -- char = "|",
 -- show_current_context_start = true,
--  show_current_context = true,
--  context_patterns = {
--    "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
--    "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
--    "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
--    "operation_type"
--  },
--}


-- indent blankline V3 setup
local scope = "focus"
local indent = "passive"

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "focus", { fg = "#7486bd" })
	vim.api.nvim_set_hl(0, "passive", { fg = "#41425e" })
end)

require("ibl").setup({
	scope = { highlight = focus },
	indent = { highlight = indent }
})

