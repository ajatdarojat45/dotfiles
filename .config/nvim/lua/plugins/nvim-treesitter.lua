return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("nvim-treesitter not available; run :Lazy sync", vim.log.levels.WARN)
      return
    end

    configs.setup({
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "editorconfig",
        "gitignore",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "php",
        "python",
        "tmux",
        "typescript",
        "vim",
        "markdown",
      },
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          node_decremental = "grm",
          scope_incremental = "grc",
        },
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
        colors = {
          "#ff6188",
          "#fc9867",
          "#ffd866",
          "#a9dc76",
          "#78dce8",
          "#ab9df2",
        },
      },
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = true },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "grr",
          },
        },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gnd",
            list_definitions = "gnD",
            list_definitions_toc = "gO",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          },
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        underline = true,
        virtual_text = {
          spacing = 5,
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        update_in_insert = true,
      }
    )

    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldlevel = 99
  end,
}

