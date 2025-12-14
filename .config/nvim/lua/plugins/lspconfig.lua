return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    ---------------------------------------------------
    -- Capabilities (nvim-cmp)
    ---------------------------------------------------
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    ---------------------------------------------------
    -- Mason-LSPConfig
    ---------------------------------------------------
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls", -- tsserver replacement
        "gopls", -- 🔴 GO LSP (WAJIB)
      },
      automatic_installation = true,
    })

    ---------------------------------------------------
    -- Native Neovim 0.11+ LSP config
    ---------------------------------------------------

    -- Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
    })

    -- TypeScript
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
    })

    -- Go (🔥 FIX WARNA GO)
    vim.lsp.config("gopls", {
      capabilities = capabilities,
      settings = {
        gopls = {
          semanticTokens = true, -- 🔴 INI KUNCI UTAMA
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
    })

    ---------------------------------------------------
    -- LSP keymaps (buffer-local)
    ---------------------------------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "ch", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "cr", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "x" }, "cf", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "cd", vim.diagnostic.open_float, opts)
      end,
    })

    ---------------------------------------------------
    -- Global hover key
    ---------------------------------------------------
    vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {
      silent = true,
      noremap = true,
    })
  end,
}

