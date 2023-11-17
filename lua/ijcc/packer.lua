-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- TELESCOPE
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- ONE DARK THEME
  use ({
	  'navarasu/onedark.nvim',
	  as = "onedark",
	  config = function()
		  require('onedark').setup {
			  style = 'darker'
		  }
		  require('onedark').load()
		  vim.cmd('colorscheme onedark')
	  end
  })

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
    }
  }

  -- undotree
  use ('mbbill/undotree')

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
          require('dashboard').setup {
              -- config
              theme = 'doom', --  theme is doom and hyper default is hyper
              config = {
                  header = require("ijcc.utils").get_dashboard_art(),
                  center = {
                      {
                          desc = 'Find File           ',
                          desc_hl = 'Number',
                          key = 'f',
                          key_hl = 'Number',
                          key_format = ' %s', -- remove default surrounding `[]`
                          action = "require('telescope.builtin').find_files()"
                      },
                      {
                          desc = 'Open Tree           ',
                          desc_hl = 'Number',
                          key = 't',
                          key_hl = 'Number',
                          key_format = ' %s', -- remove default surrounding `[]`
                          action = "vim.api.nvim_command(':NvimTreeOpen')"
                      },
                      {
                          desc = 'Find Recent Files  ',
                          desc_hl = 'Number',
                          key = 'r',
                          key_hl = 'Number',
                          key_format = ' %s', -- remove default surrounding `[]`
                          action = "require('telescope.builtin').oldfiles()"
                      },
                      {
                          desc = 'Find Word          ',
                          desc_hl = 'Number',
                          key = 'w',
                          key_hl = 'Number',
                          key_format = ' %s', -- remove default surrounding `[]`
                          action = "require('telescope.builtin').live_grep()"
                      },
                      {
                          desc = 'Search Git Files   ',
                          desc_hl = 'Number',
                          key = 'g',
                          key_hl = 'Number',
                          key_format = ' %s', -- remove default surrounding `[]`
                          action = "require('telescope.builtin').git_files()"
                      },
                  },
                  footer = {"i just can't vim       https://github.com/fabu11"}
              },
              hide = {
                  statusline=true,    -- hide statusline default is true
                  tabline = true,       -- hide the tabline
                  winbar  = true,       -- hide winbar
              },
          }
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
end)
