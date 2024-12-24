return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup
      {
        theme = 'doom', --  theme is doom and hyper default is hyper
        config = {
          header = require("core.utils").get_dashboard_art(),
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
              action = "vim.api.nvim_command(':Oil')"
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
          footer = { "i just can't vim       https://github.com/fabu11" }
        },
        hide = {
          statusline = true,
          tabline    = true,
          winbar     = true,
        },
      }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  }
}
