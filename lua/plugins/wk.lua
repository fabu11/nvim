return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        preset = "modern",
        win = {
          no_overlap = true,
          title_pos = "center",
        },
        layout = {
          width = { min = 20 },
          spacing = 5,
        },
        icons = {
          separator = "»",
        },
        -- icons = { mappings = false, rules = false },
      })
      wk.add({
        { "<leader><leader>", hidden = true, desc = "close which-key", "<esc>", mode = "n" },
        -- Buffer Shortcuts
        { "<leader>", desc = "Buffer [1-9]", mode = "n" },
        { "<leader>1", desc = "Buffer 1", hidden = false, "<Cmd>BufferLineGoToBuffer 1<CR>", mode = "n" },
        { "<leader>2", desc = "Buffer 2", hidden = false, "<Cmd>BufferLineGoToBuffer 2<CR>", mode = "n" },
        { "<leader>3", desc = "Buffer 3", hidden = false, "<Cmd>BufferLineGoToBuffer 3<CR>", mode = "n" },
        { "<leader>4", desc = "Buffer 4", hidden = false, "<Cmd>BufferLineGoToBuffer 4<CR>", mode = "n" },
        { "<leader>5", desc = "Buffer 5", hidden = false, "<Cmd>BufferLineGoToBuffer 5<CR>", mode = "n" },
        { "<leader>6", desc = "Buffer 6", hidden = false, "<Cmd>BufferLineGoToBuffer 6<CR>", mode = "n" },
        { "<leader>7", desc = "Buffer 7", hidden = false, "<Cmd>BufferLineGoToBuffer 7<CR>", mode = "n" },
        { "<leader>8", desc = "Buffer 8", hidden = false, "<Cmd>BufferLineGoToBuffer 8<CR>", mode = "n" },
        { "<leader>9", desc = "Buffer 9", hidden = false, "<Cmd>BufferLineGoToBuffer 9<CR>", mode = "n" },
        -- File Group
        { "<leader>f", group = "File", icon = { icon = "", color = "green" } },
        ----> Telescope
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files", mode = "n" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files", mode = "n", icon = { icon = "", color = "green" } },
        { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Search Words", mode = "n", icon = { icon = "", color = "green" } },
        { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Live Grep", mode = "n", icon = { icon = "", color = "green" } },
        ----> Toggle Trees
        { "<leader>ft", "<cmd>lua require('oil').toggle_float()<cr>", desc = "Toggle File Tree", mode = "n", icon = { icon = "󰙅", color = "green" } },
        { "<leader>fu", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undo Tree", mode = "n", icon = { icon = "󰙅", color = "green" } },
        -- Term
        { "<leader>t", group = "Terminal" },
        { "<c-\\>", "<cmd>lua _TOGGLE_FLOAT_TERM()<CR>", desc = "Toggle Float Terminal", mode = "ni" },
        { "<leader>tt", "<cmd>Telescope toggleterm_manager<CR>", desc = "Terminal Manager", mode = "n" },
        { "<leader>t1", "<cmd>lua _TOGGLE_TERMINAL_1()<CR>", desc = "Toggle Terminal 1", mode = "n" },
        { "<leader>t2", "<cmd>lua _TOGGLE_TERMINAL_2()<CR>", desc = "Toggle Terminal 2", mode = "n" },
        { "<leader>t3", "<cmd>lua _TOGGLE_TERMINAL_3()<CR>", desc = "Toggle Terminal 3", mode = "n" },
        { "<leader>to", "<cmd>lua _TOGGLE_ALL_TERMINALS_ON()<CR>", desc = "Open  Terminals [1-3]", mode = "n" },
        { "<leader>tc", "<cmd>lua _TOGGLE_ALL_TERMINALS_OFF()<CR>", desc = "Close Terminals [1-3]", mode = "n" },

        -- Trouble Diag
        { "<leader>e", group = "Diagnostics" },
        { "<leader>ee", "<cmd>Trouble diagnostics toggle win.position=right<CR>", desc = "Toggle Diagnostics" },
        { "<leader>el", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ..." },
        { "<leader>eq", "<cmd>Trouble qflist toggle<cr>", desc = "Toggle Quick Fix List", mode = "n" },
        -- code runner
        { "<leader>l", group = "Language", icon = { icon = "", color = "purple" } },
        { "<leader>lr", desc = "Code Runner", icon = { icon = "", color = 'purple' } },
        { "<leader>lk", desc = "Toggle Float Sig", icon = { icon = "?", color = 'purple' } },
        { "<leader>lp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle .md preview", icon = { icon = "󰈈", color = 'purple' } },

        ----> Misc.
        { "<leader>f=", "gg=Ggg", desc = "Format File", mode = "n", icon = { icon = "󰁨", color = "green" } },
        { "<leader>y", ":'<,'>w !clip.exe<CR><CR>", desc = "Copy to System Clipboard", mode = "v" },
        {
          "<leader>T",
          "<cmd>lua require('telescope.builtin').colorscheme({enable_preview=true})<CR>",
          desc = "Change Theme",
          icon = { icon = "", color = "orange" }
        },
        {
          mode = { "n", "v" },                                                                              -- NORMAL and VISUAL mode
          -- reg for copy to system Clipboard
          { "<leader>q", "<cmd>lua require('core.utils').close_buffer(false)<cr>", desc = "Close Buffer" }, -- no need to specify mode since it's inherited
          { "<leader>w", "<cmd>w<cr>", desc = "Write", icon = { icon = "", color = "yellow" } },
          { "<leader>c", group = "Comment", icon = { icon = "", color = "cyan" } },
          { "<leader>cb", desc = "Comment Block", icon = { icon = "", color = "cyan" } },
          { "<leader>c/", desc = "Comment Line", icon = { icon = "", color = "cyan" } },

        }
      })
    end

  }
}
