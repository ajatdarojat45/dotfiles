return {
  "MunifTanjim/prettier.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local prettier = require("prettier")

    prettier.setup({
      bin = "prettierd",
      ["null-ls"] = {
        condition = function()
          return prettier.config_exists({
            check_package_json = true,
          })
        end,
        runtime_condition = function()
          return true
        end,
        timeout = 5000,
      },
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
        "jsx",
        "go",
        "lua",
      },
    })
  end,
}
