return {
  {
    "ryanmsnyder/toggleterm-manager.nvim",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
    },
    config = function()
      -- Configure toggleterm
      require("toggleterm").setup {
        size = 12,
        open_mapping = [[<c-\>]], -- Bind Ctrl-\ to toggle the float terminal
        direction = 'horizontal', -- Default direction
        close_on_exit = true,     -- Close the terminal process when it exits
        persist_mode = true,      -- Persist terminal sessions
        persist_size = true,      -- Persist terminal sizes
        float_opts = {
          border = "curved",      -- Border style for floating terminals
          height = 24,
          winblend = 10,
        },
      }

      -- Create terminals 1-3 (horizontal)
      local Terminal = require('toggleterm.terminal').Terminal

      -- Terminal 1
      local terminal1 = Terminal:new({ direction = 'horizontal', hidden = true })
      function _TOGGLE_TERMINAL_1()
        terminal1:toggle()
      end

      -- Terminal 2
      local terminal2 = Terminal:new({ direction = 'horizontal', hidden = true })
      function _TOGGLE_TERMINAL_2()
        terminal2:toggle()
      end

      -- Terminal 3
      local terminal3 = Terminal:new({ direction = 'horizontal', hidden = true })
      function _TOGGLE_TERMINAL_3()
        terminal3:toggle()
      end

      -- Floating terminal (Ctrl-\)
      local float_term = Terminal:new({ direction = 'float', hidden = true })
      function _TOGGLE_FLOAT_TERM()
        float_term:toggle()
      end

      -- Function to toggle all terminals off
      function _TOGGLE_ALL_TERMINALS_OFF()
        if terminal1:is_open() then terminal1:toggle() end
        if terminal2:is_open() then terminal2:toggle() end
        if terminal3:is_open() then terminal3:toggle() end
      end

      -- Function to toggle all terminals on
      function _TOGGLE_ALL_TERMINALS_ON()
        if not terminal1:is_open() then terminal1:toggle() end
        if not terminal2:is_open() then terminal2:toggle() end
        if not terminal3:is_open() then terminal3:toggle() end
      end

      -- Lazygit terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })
      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      -- ToggleTerm Manager setup
      local toggleterm_manager = require("toggleterm-manager")
      local actions = toggleterm_manager.actions
      toggleterm_manager.setup {
        titles = {
          prompt = "Pick Term",
          results = "Terminals"
        },
        mappings = {
          i = {
            ["<CR>"] = { action = actions.toggle_term, exit_on_action = false },
            ["<C-a>"] = { action = actions.create_term, exit_on_action = false },
            ["<C-d>"] = { action = actions.delete_term, exit_on_action = false },
            ["<C-r>"] = { action = actions.rename_term, exit_on_action = false },
          },
        },
      }
    end,
  },
}
