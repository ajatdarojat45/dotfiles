require('Comment').setup()

vim.api.nvim_set_keymap('n', '<leader>cc', '<Plug>(comment_toggle_linewise_current)', {})
