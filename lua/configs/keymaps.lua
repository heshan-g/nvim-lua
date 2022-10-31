vim.g.mapleader = " "

-- vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

vim.keymap.set('n', '<leader>nh', ':nohl<CR>')

vim.keymap.set('n', 'x', '"_x') -- deleting characters using 'x' will not copy to clipboard

-- NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Telescope
vim.keymap.set("n", "<c-p>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<c-f>", "<cmd>Telescope live_grep<cr>", { noremap = true }) -- find string in current working directory as you type
-- vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

