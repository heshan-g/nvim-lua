require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'jsonls',
    'html',
    'sumneko_lua'
  }
})
