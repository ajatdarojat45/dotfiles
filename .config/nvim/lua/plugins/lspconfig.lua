return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "ts_ls", "gopls" },
      automatic_installation = true,
    })

    local lspconfig_defaults = require("lspconfig").util.default_config
    local keymap = vim.keymap

    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      "force",
      lspconfig_defaults.capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }

        keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        keymap.set("n", "ch", function()
          vim.lsp.buf.hover()
          vim.defer_fn(function()
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local config = vim.api.nvim_win_get_config(win)
              if config.relative ~= "" then
                vim.api.nvim_set_current_win(win)
                break
              end
            end
          end, 100)
        end, opts)
        keymap.set("n", "cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        keymap.set({ "n", "x" }, "cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        keymap.set("n", "cd", function()
          vim.diagnostic.open_float()
          vim.defer_fn(function()
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local config = vim.api.nvim_win_get_config(win)
              if config.relative ~= "" then
                vim.api.nvim_set_current_win(win)
                break
              end
            end
          end, 100)
        end, opts)
      end,
    })

    keymap.set("n", "<leader>d", vim.lsp.buf.hover, { silent = true, noremap = true })
  end,
}
