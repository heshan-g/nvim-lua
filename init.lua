require('plugins')
require('plugin-configs.comment')
require('plugin-configs.nvim-tree')
require('plugin-configs.lualine')
require('plugin-configs.telescope')
require('plugin-configs.nvim-cmp')
require('plugin-configs.lsp.mason')
require('plugin-configs.lsp.lspsaga')
require('plugin-configs.lsp.lspconfig')
require('plugin-configs.lsp.null-ls')

require('configs.options')
require('configs.keymaps')

vim.cmd.colorscheme('nightfly');

