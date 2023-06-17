
require('nvim-ts-autotag').setup({
    autotag = {
      enable = true,
      filetypes = {
        'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 
        'rescript', 'xml', 'php', 'markdown', 'glimmer', 'handlebars', 'hbs'
      }
    }
  })
