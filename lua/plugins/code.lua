return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
          floating_window = false,
          hint_enable = true,
          always_trigger = true,
          toggle_key = '<C-s>',
          doc_lines = 15,
          handler_opts = {
            border = "single"
          }
        },
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
      },
      {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = {
          'rafamadriz/friendly-snippets',
          {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
              library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
              },
            },
          },
        },
        version = "v0.*",
        opts = {
          sources = {
            -- add lazydev to your completion providers
            default = {
              enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
            },
            providers = {
              -- dont show LuaLS require statements when lazydev has items
              lsp = { fallbacks = { "lazydev" } },
              lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
            },
          },
          keymap = {
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<C-y>'] = { 'accept', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<Tab>'] = { 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
          },
          appearance = {
            nerd_font_variant = "normal"
          },
          completion = {
            list = {
              selection = 'auto_insert',
            },
          },
        }
      },
      {
        "williamboman/mason.nvim",
        config = true
      },
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup {
            ensure_installed = { "lua_ls", "clangd" },
            automatic_installation = false,
          }
        end
      },
    },
    config = function()
      local capa = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')
      lspconfig['lua_ls'].setup({ capabilities = capa })
      lspconfig['clangd'].setup({ capabilities = capa })
      lspconfig['pyright'].setup({ capabilities = capa })

      -- formatting
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if not client then return end
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  },
  -- DEFAULT
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
  {
    "windwp/nvim-autopairs",
    opts = {},
  }
}
