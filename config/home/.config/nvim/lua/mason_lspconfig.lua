require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
     ensure_installed = { "tsserver" },
    })

-- list of languages: 
-- bashls dockerls cssls dockerls docker_compose_language_service golangci_lint_ls grammarly graphql jsonls marksman intelephense sqls tailwindcss tsserver volar
