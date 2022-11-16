vim.g.mapleader = ' '

-- vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

vim.keymap.set('n', '<leader>nh', ':nohl<CR>')

vim.keymap.set('n', 'x', '"_x') -- deleting characters using 'x' will not copy to clipboard

-- NvimTree and buffers
vim.keymap.set({ 'n', 'v' }, '<leader>e', ':NvimTreeFindFile<CR>', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<leader>t', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set({ 'n', 'v', 'i' }, '<c-L>', '<cmd>bnext<cr>')
vim.keymap.set({ 'n', 'v', 'i' }, '<c-H>', '<cmd>bprev<cr>')
vim.keymap.set({ 'n' }, '<leader>q', '<cmd>Bdelete<cr>', { noremap = true })

-- Telescope
vim.keymap.set({ 'n', 'v', 'i' }, '<c-p>', '<cmd>Telescope find_files<cr>', { noremap = true }) -- find files within current working directory, respects .gitignore
vim.keymap.set({ 'n', 'v', 'i' }, '<c-f>', '<cmd>Telescope live_grep<cr>', { noremap = true }) -- find string in current working directory as you type
-- vim.keymap.set({ 'n', 'v', 'i' }, '<leader>fc', '<cmd>Telescope grep_string<cr>') -- find string under cursor in current working directory
-- vim.keymap.set({ 'n', 'v', 'i' }, '<leader>fb', '<cmd>Telescope buffers<cr>') -- list open buffers in current neovim instance
-- vim.keymap.set({ 'n', 'v', 'i' }, '<leader>fh', '<cmd>Telescope help_tags<cr>') -- list available help tags

