return {
    {
        'stevearc/oil.nvim',
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        config = function()
            require("oil").setup {
                columns = { "icon" },
                keymaps = {
                    ["l"] = { "actions.select", mode = "n" },
                    ["h"] = { "actions.parent", mode = "n" },
                    ["<right>"] = { "actions.select", mode = "n" },
                    ["<left>"] = { "actions.parent", mode = "n" },
                    ["<esc>"] = { "actions.close", mode = "n" },
                },
                view_options = {
                    show_hidden = true,
                },
                float = {
                    max_width = math.floor(vim.o.columns * 0.5), -- 80% of the screen width
                    max_height = math.floor(vim.o.lines * 0.5),  -- 80% of the screen height
                    preview_split = "auto",
                    win_options = {
                        winblend = 10,
                    }

                }
            }
        end
    }
}
