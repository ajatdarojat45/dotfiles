require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig_defaults = require('lspconfig').util.default_config
local cmp = require('cmp')
local keymap = vim.keymap
local api = vim.api

require("mason-lspconfig").setup_handlers {
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
}

lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    keymap.set('n', 'ch', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    keymap.set('n', 'cr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    keymap.set({ 'n', 'x' }, 'cf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- Autocompletion config
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
})

-- lspconfig
--vim.api.nvim_set_keymap('n', '<leader>d', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>d', vim.lsp.buf.hover, { silent = true, noremap = true })
