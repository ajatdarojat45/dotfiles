-- Konfigurasi nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash", "css", "dockerfile", "editorconfig", "gitignore", "go", "html", "http", "java", "javascript", "json", "lua", "nginx", "php", "python", "regex", "sql", "tmux", "typescript", "vim", "yaml"}, 
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
      init_selection = "gnn", -- Tombol untuk mulai pemilihan
      node_incremental = "grn", -- Tombol untuk meningkatkan pemilihan node
      node_decremental = "grm", -- Tombol untuk mengurangi pemilihan node
      scope_incremental = "grc", -- Tombol untuk meningkatkan pemilihan scope
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Aktifkan untuk lebih banyak tipe kode
    max_file_lines = nil, -- Tidak ada batasan jumlah baris
    colors = {
      "#ff6188", "#fc9867", "#ffd866", "#a9dc76", "#78dce8", "#ab9df2"
    },
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr", -- Tombol untuk rename
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd", -- Tombol untuk pergi ke definisi
        list_definitions = "gnD", -- Tombol untuk daftar definisi
        list_definitions_toc = "gO", -- Tombol untuk daftar definisi di TOC
        goto_next_usage = "<a-*>", -- Tombol untuk penggunaan berikutnya
        goto_previous_usage = "<a-#>", -- Tombol untuk penggunaan sebelumnya
      },
    },
  },
  -- Text objects
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Mencari teks ke depan
      keymaps = {
        ["af"] = "@function.outer", -- Memilih seluruh fungsi
        ["if"] = "@function.inner", -- Memilih isi fungsi
        ["ac"] = "@class.outer", -- Memilih seluruh kelas
        ["ic"] = "@class.inner", -- Memilih isi kelas
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- Menyimpan langkah untuk navigasi
      goto_next_start = {
        ["]m"] = "@function.outer", -- Pergi ke awal fungsi berikutnya
        ["]]"] = "@class.outer", -- Pergi ke awal kelas berikutnya
      },
      goto_next_end = {
        ["]M"] = "@function.outer", -- Pergi ke akhir fungsi berikutnya
        ["]["] = "@class.outer", -- Pergi ke akhir kelas berikutnya
      },
      goto_previous_start = {
        ["[m"] = "@function.outer", -- Pergi ke awal fungsi sebelumnya
        ["[["] = "@class.outer", -- Pergi ke awal kelas sebelumnya
      },
      goto_previous_end = {
        ["[M"] = "@function.outer", -- Pergi ke akhir fungsi sebelumnya
        ["[]"] = "@class.outer", -- Pergi ke akhir kelas sebelumnya
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner", -- Menukar parameter ke depan
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner", -- Menukar parameter sebelumnya
      },
    },
  },
}

-- Konfigurasi LSP untuk diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            --severity_limit = 'Warning',
            severity = { min = vim.diagnostic.severity.ERROR },
        },
        update_in_insert = true,
    }
)

--vim.opt.foldmethod = 'expr'  -- Gunakan metode folding berdasarkan ekspresi
--vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'  -- Gunakan foldexpr dari nvim-treesitter
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99

