-- ensure packer is installed
local packer_install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_install_path})
  vim.cmd 'packadd packer.nvim'
end

-- run :PackerCompile when init_packer.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init_packer.lua source <afile> | PackerCompile
  augroup end
]])

-- plugin declarations
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons' --  file icons. used by nvim-tree/galasyline/telescope/barbar
  use 'nvim-lua/plenary.nvim' --  used by telescope

  use 'christoomey/vim-tmux-navigator'

  use 'rafi/awesome-vim-colorschemes' --  colorschemes
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = function() require'plugins.config_galaxyline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  -- use {
  --   'romgrk/barbar.nvim',
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }--  tabline/bufferline
  use 'liuchengxu/vista.vim' --  right column
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }--  left column tree
  use 'tpope/vim-obsession' --  remember current session
  use 'lukas-reineke/indent-blankline.nvim' --  indent lines

--  git stuff
  use 'mhinz/vim-signify'
  use 'rhysd/git-messenger.vim'
  use 'tpope/vim-fugitive' --  Fugitive is required for Conflicted
  use 'christoomey/vim-conflicted'

  use {'neoclide/coc.nvim', branch = 'release'}
  use 'jackguo380/vim-lsp-cxx-highlight'
  use 'rust-lang/rust.vim'
  use 'dln/avro-vim'
  use 'kchmck/vim-coffee-script'
  use 'noc7c9/vim-iced-coffee-script'
  use 'lchi/vim-toffee'

  use 'tpope/vim-surround'
  use 'dhruvasagar/vim-table-mode'

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require "plugins.config_telescope"
    end,
    requires = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
    }
  }-- CtrlF/CtrlP

end)
