return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim"
  },
  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  -- Line numbers
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      -- Custom function to show both absolute and relative line numbers
      local function lnum_both()
        local lnum = vim.v.lnum
        local relnum = vim.v.lnum == vim.fn.line(".") and 0 or math.abs(vim.v.lnum - vim.fn.line("."))
        return string.format("%3d %2d", lnum, relnum)
      end
      require("statuscol").setup({
        ft_ignore = {"oil", "terminal"},
        bt_ignore = {"terminal"},
        setopt = true,
        segments = {
          {
            sign = {
              namespace = { "gitsigns.*" },
              name = { "gitsigns.*" },
            },
          },
          {
            sign = {
              namespace = { ".*" },
              name = { ".*" },
              auto = true,
            },
          },
          {
            text = { lnum_both, " " },
            condition = { true },
            click = "v:lua.ScLa",
          },
        },
      })
    end,
  },

  ------- Oil ----------------------------
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
                  border="single",
                  max_width = math.floor(vim.o.columns * 0.5), -- 80% of the screen width
                  max_height = math.floor(vim.o.lines * 0.5),  -- 80% of the screen height
                  preview_split = "auto",
                  win_options = {
                      winblend = 10,
                  }

              }
          }
      end
  },
  ------- Buffer Line --------------------
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
                mode = "buffers",
                themable = true,
                numbers = "ordinal",
                close_command = function()
                    require("core.utils").close_buffer(false)
                end,
                left_mouse_command = 'buffer %d',
                middle_mouse_command = function()
                    require("core.utils").close_buffer(false)
                end,
                indicator = {
                    icon = '▎',
                    style = 'icon'
                },
                buffer_close_icon = '✘',
                modified_icon = '●',
                close_icon = '✘',
                left_trunc_marker = '...',
                right_trunc_marker = '...',
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                truncate_names = true,  -- whether or not tab names should be truncated
                tab_size = 10,
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
                color_icons = false,
                show_buffer_icons = false,
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
  ------- Indent Lines -------------------
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
}
