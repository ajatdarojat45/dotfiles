return {
  "terryma/vim-multiple-cursors",
  event = "VeryLazy",
  init = function()
    -- Optional: custom keymaps (default is Ctrl+n, Ctrl+p, Ctrl+x)
    vim.g.multi_cursor_use_default_mapping = 1

    -- Disable conflicting keymaps if needed
    vim.g.multi_cursor_next_key = "<C-n>"
    vim.g.multi_cursor_prev_key = "<C-p>"
    vim.g.multi_cursor_skip_key = "<C-x>"
    vim.g.multi_cursor_quit_key = "<Esc>"
  end,
}
