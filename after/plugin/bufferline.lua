
bufferline = require("bufferline")
bufferline.setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers =  "ordinal",
        close_command = function ()
            require("ijcc.utils").close_buffer(false)
        end,
        right_mouse_command = function ()
            require("ijcc.utils").close_buffer(false)
        end,
        left_mouse_command = 'buffer %d',
        middle_mouse_command = function ()
            require("ijcc.utils").close_buffer(false)
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
        truncate_names = true, -- whether or not tab names should be truncated
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
        show_duplicate_prefix =  false, -- whether to show duplicate buffer prefix
        move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin",
        style_preset = bufferline.style_preset.no_italic,
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_at_end'
    }
}



