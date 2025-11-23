return {
  {
    "e-ink-colorscheme/e-ink.nvim",
     --priority = 1000,
     config = function ()
        require("e-ink").setup()
        --vim.cmd.colorscheme "e-ink"
        --vim.opt.background = "dark"
     end
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup()
    end
  },
  {
    "folke/tokyonight.nvim",
    opts={},
  },
  {
    "navarasu/onedark.nvim",
    opts = {}
  },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        -- add the config here
        themes = {
          {
            name="e-ink-dark",
            colorscheme="e-ink",
            before=[[
              vim.opt.background = "dark"
            ]],
          },
          {
            name="e-ink-light",
            colorscheme="e-ink",
            before=[[
              vim.opt.background = "light"
            ]],
          },
          "kanagawa-wave",
          "kanagawa-dragon",
          "kanagawa-lotus",
          "tokyonight-night",
          "tokyonight-storm",
          "tokyonight-day",
          "tokyonight-moon",
          {
            name="onedark",
            colorscheme="onedark",
            before=[[
              require('onedark').setup {
                style = 'dark'
              }
            ]]
          },
          {
            name="onedark-darker",
            colorscheme="onedark",
            before=[[
              require('onedark').setup {
                style = 'darker'
              }
            ]]
          },
          {
            name="onedark-cool",
            colorscheme="onedark",
            before=[[
              require('onedark').setup {
                style = 'cool'
              }
            ]]
          },
          {
            name="onedark-deep",
            colorscheme="onedark",
            before=[[
              require('onedark').setup {
                style = 'deep'
              }
            ]]
          },
          {
            name="onedark-warm",
            colorscheme="onedark",
            before=[[
              require('onedark').setup {
                style = 'warm'
              }
            ]]
          },
          {
            name="onedark-warmer",
            colorscheme="onedark",
            before=[[
              require('onedark').setup {
                style = 'warmer'
              }
            ]]
          },
        },
        livePreview=true,
      })
    end
  }

}
