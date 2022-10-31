vim.g.mapleader = " "

-- vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

vim.keymap.set('n', '<leader>nh', ':nohl<CR>')

vim.keymap.set('n', 'x', '"_x') -- deleting characters using 'x' will not copy to clipboard

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

