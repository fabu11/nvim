return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts =
        {
            options = {
                icons_enabled = false,
                component_separators = { left = ' ', right = ' ' },
                section_separators = { left = ' ', right = ' ' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = false,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diagnostics' },
                lualine_c = { 'filename'},
                lualine_x = { '', '', '' },
                lualine_y = { 'diff',
                              'location',
                              function()
                                 return vim.fn.strlen(vim.fn.getline('.'))
                              end,
                            },
                lualine_z = { 
                              
                            }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    },
}


