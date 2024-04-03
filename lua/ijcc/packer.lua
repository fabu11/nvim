-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Luarocks
    -- TELESCOPE
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- THEMES
    use { "ellisonleao/gruvbox.nvim" }
    use{"folke/tokyonight.nvim"}
    use ({'navarasu/onedark.nvim'})
    use "rebelot/kanagawa.nvim"

  -- TREE SITTER
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  use 'numToStr/Comment.nvim'
  -- NVIM-Tree
  use ({
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional
      },
  })

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
      {'neovim/nvim-lspconfig'},
    -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      {"hrsh7th/cmp-nvim-lsp-signature-help"}
    }
  }


  -- undotree
  use ('mbbill/undotree')

  --vim lastplace
  use{
      'farmergreg/vim-lastplace',
  }

  -- Tabline
  use({ 'seblj/nvim-tabline', requires = { 'nvim-tree/nvim-web-devicons' } })

  -- bufferline
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'orlp/vim-bunlink'

  --code runner
  use 'CRAG666/code_runner.nvim'

  -- toggleTerm
  use ({"akinsho/toggleterm.nvim", tag = '*'})

  -- statusline
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- dashboard
  use {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
          require("ijcc.utils").c_dashboard() -- prob slower but no config in packer = :)
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
  }
  -- which key
  use {
      "folke/which-key.nvim",
  }
  --trouble (diagnostics)
  use{
      "folke/trouble.nvim",
      requires = { "nvim-tree/nvim-web-devicons" },
  }
  --Autopairs
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- .md preview 
  use {'iamcco/markdown-preview.nvim'}
end)
