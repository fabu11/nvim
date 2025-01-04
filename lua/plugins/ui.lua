return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            local bufferline = require("bufferline")
            bufferline.setup {
                options = {
                    mode = "buffers", -- set to "tabs" to only show tabpages instead
                    themable = true,  -- allows highlight groups to be overriden i.e. sets highlights as default
                    numbers = "ordinal",
                    close_command = function()
                        require("core.utils").close_buffer(false)
                    end,
                    left_mouse_command = 'buffer %d',
                    middle_mouse_command = function()
                        require("core.utils").close_buffer(false)
                    end,
                    indicator = {
                        icon = '▎', -- this should be omitted if indicator style is not 'icon'
                        style = 'icon'
                    },
                    buffer_close_icon = '󰅖',
                    modified_icon = '*',
                    close_icon = '',
                    left_trunc_marker = '...',
                    right_trunc_marker = '...',
                    --- name_formatter can be used to change the buffer's label in the bufferline.
                    --- Please note some names can/will break the
                    --- bufferline so use this at your discretion knowing that it has
                    --- some limitations that will *NOT* be fixed.
                    max_name_length = 18,
                    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                    truncate_names = true,  -- whether or not tab names should be truncated
                    tab_size = 18,
                    diagnostics = "nvim_lsp",
                    diagnostics_update_in_insert = false,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Tree",
                            text_align = "left",
                            separator = true
                        }
                    },
                    color_icons = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
                    move_wraps_at_ends = false,    -- whether or not the move command "wraps" at the first or last position
                    -- can also be a table containing 2 custom separators
                    -- [focused and unfocused]. eg: { '|', '|' }
                    separator_style = "thin",
                    style_preset = bufferline.style_preset.no_italic,
                    enforce_regular_tabs = true,
                    always_show_bufferline = true,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { 'close' }
                    },
                    sort_by = 'insert_at_end'
                }
            }
        end
    },
    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts =
        {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
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
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "raddari/last-color.nvim",
        config = function()
            local theme = require('last-color').recall() or "kanawaga-dragon"
            vim.cmd.colorscheme(theme)
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "╎",
                },
                exclude = {
                    filetypes = {
                        "dashboard",
                        "oil",
                    },
                    buftypes = {
                        "terminal"
                    }
                }
            })
        end
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            require("mini.indentscope").setup({
                delay = 1,
                animation = require("mini.indentscope").gen_animation.none(),
            })

            -- Disable mini.indentscope for specific filetypes
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "dashboard", "oil", "terminal" },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end, -- defined in wk.lua
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = { -- defined in wk.lua
        }
    },
}
