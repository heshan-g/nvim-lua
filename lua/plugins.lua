local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Auto-sync packer when saving changes (to this file)
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

	use 'ellisonleao/gruvbox.nvim'
  use 'bluz71/vim-nightfly-guicolors'

  use 'tpope/vim-surround'
  use 'numToStr/Comment.nvim'

  use 'nvim-tree/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  use 'nvim-lualine/lualine.nvim'

  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- Managing and installing lsp servers, linters & formatters
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Configuring lsp servers
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use({ 'glepnir/lspsaga.nvim', branch = 'main' })
  use 'jose-elias-alvarez/typescript.nvim' -- additional tools like renaming
  use 'onsails/lspkind.nvim' -- VS Code like icons to autocompletion window

  -- formatting and linting
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'

  -- treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end
  })

  -- auto pairs and tags
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- gitsigns
  use 'lewis6991/gitsigns.nvim'

  -- bufferline
  use 'akinsho/bufferline.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

