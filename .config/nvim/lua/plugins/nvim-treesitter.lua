return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  priority = 900,
  config = function()
    -- Ensure parsers are installed
    local ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "editorconfig",
      "gitignore",
      "go",
      "gomod",
      "gosum",
      "html",
      "javascript",
      "json",
      "lua",
      "php",
      "python",
      "tmux",
      "typescript",
      "tsx",
      "vim",
      "vimdoc",
      "markdown",
      "markdown_inline",
      "yaml",
      "toml",
    }

    -- Auto-install missing parsers
    for _, lang in ipairs(ensure_installed) do
      local ok = pcall(vim.treesitter.language.inspect, lang)
      if not ok then
        pcall(function()
          vim.cmd("TSInstall " .. lang)
        end)
      end
    end

    -- Enable treesitter highlight for all buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        if ft == "" then
          return
        end
        local lang = vim.treesitter.language.get_lang(ft) or ft
        local ok = pcall(vim.treesitter.language.inspect, lang)
        if ok then
          pcall(vim.treesitter.start, buf, lang)
        end
      end,
    })

    -- Incremental selection keymaps (built-in)
    vim.keymap.set("n", "gnn", function()
      require("nvim-treesitter.incremental_selection").init_selection()
    end, { desc = "Init treesitter selection" })
    vim.keymap.set("x", "grn", function()
      require("nvim-treesitter.incremental_selection").node_incremental()
    end, { desc = "Increment node selection" })
    vim.keymap.set("x", "grm", function()
      require("nvim-treesitter.incremental_selection").node_decremental()
    end, { desc = "Decrement node selection" })
    vim.keymap.set("x", "grc", function()
      require("nvim-treesitter.incremental_selection").scope_incremental()
    end, { desc = "Increment scope selection" })

    -- LSP diagnostic config
    vim.diagnostic.config({
      underline = true,
      virtual_text = {
        spacing = 5,
        severity = { min = vim.diagnostic.severity.ERROR },
      },
      update_in_insert = true,
    })

    -- Folding with treesitter
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldlevel = 99
  end,
}

