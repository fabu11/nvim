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
			  style = 'warm'
		  }
		  require('onedark').load()
		  vim.cmd('colorscheme onedark')
	  end
  })

  -- TREE SITTER
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

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


  --code runner
  use 'CRAG666/code_runner.nvim'

  -- toggleTerm
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  -- statusline
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }





  -- Splash Screen... the monster
  use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require"startup".setup({
     -- every line should be same width without escaped \
        header = {
            type = "text",
            oldfiles_directory = false,
            align = "center",
            fold_section = false,
            title = "Header",
            margin = 5,
            content = {

" fabu11's                                                    ",
"          _              _         _              _      ",
"         /\\ \\           /\\ \\     /\\ \\           /\\ \\     ",
"         \\ \\ \\          \\ \\ \\   /  \\ \\         /  \\ \\    ",
"         /\\ \\_\\         /\\ \\_\\ / /\\ \\ \\       / /\\ \\ \\   ",
"        / /\\/_/        / /\\/_// / /\\ \\ \\     / / /\\ \\ \\  ",
"       / / /  _       / / /  / / /  \\ \\_\\   / / /  \\ \\_\\ ",
"      / / /  /\\ \\    / / /  / / /    \\/_/  / / /    \\/_/ ",
"     / / /   \\ \\_\\  / / /  / / /          / / /          ",
" ___/ / /__  / / /_/ / /  / / /________  / / /________   ",
"/\\__\\/_/___\\/ / /__\\/ /  / / /_________\\/ / /_________\\  ",
"\\/_________/\\/_______/   \\/____________/\\/____________/  ",
"                                  dev-wsl-ubuntu-20.0.4  ",
            },
            highlight = "Number",
            default_color = "",
            oldfiles_amount = 0,
        },
        -- name which will be displayed and command
        body = {
            type = "mapping",
            oldfiles_directory = false,
            align = "center",
            fold_section = false,
            title = "Basic Commands",
            margin = 5,
            content = {
                { " Find File", "Telescope find_files", "<leader>ff" },
                { "󰍉 Find Word", "Telescope live_grep", "<leader>lg" },
                { " Recent Files", "Telescope oldfiles", "<leader>of" },
                { " File Browser", "Telescope file_browser", "<leader>fb" },
                { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
                { " New File", "lua require'startup'.new_file()", "<leader>nf" },
            },
            highlight = "String",
            default_color = "",
            oldfiles_amount = 0,
        },


        clock = {
            type = "text",
            oldfiles_directory = false,
            align = "center",
            fold_section = false,
            title = "Footer",
            margin = 5,
            content = function()
                local clock = " " .. os.date "%H:%M"
                local date = " " .. os.date "%d-%m-%y"
                return {clock,date}
            end,
            highlight = "Number",
            default_color = "",
            oldfiles_amount = 0,
        },

        footer = {
            type = "text",
            oldfiles_directory = false,
            align = "center",
            fold_section = false,
            title = "Footer",
            margin = 5,
            content = {
                "• GitLab : https://github.com/fabu11",
            },
            highlight = "Number",
            default_color = "",
            oldfiles_amount = 0,
        },
        options = {
            mapping_keys = true,
            cursor_column = 0.5,
            empty_lines_between_mappings = true,
            disable_statuslines = true,
            paddings = { 1, 3, 3, 0 },
        },
        mappings = {
            execute_command = "<CR>",
            open_file = "o",
            open_file_split = "<c-o>",
            open_section = "<TAB>",
            open_help = "?",
        },
        colors = {
            background = "#1f2227",
            folded_section = "#56b6c2",
        },
        parts = { "header", "clock", "body", "footer"},
    })
  end
  }

end)





