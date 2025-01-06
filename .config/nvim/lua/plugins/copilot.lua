
-- Enable Copilot suggestion
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Copilot filetypes settings
vim.g.copilot_filetypes = {
  ["*"] = true,        -- Enable for all filetypes by default
  ["markdown"] = true, -- Enable for Markdown
  ["yaml"] = false,    -- Disable for YAML
}
