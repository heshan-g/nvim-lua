require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'jsonls',
    'html',
    'sumneko_lua'
  }
})

require('mason-null-ls').setup({
  ensure_installed = {
    'prettier',
    'eslint_d',
  }
})
