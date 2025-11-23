return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "neovim/nvim-lspconfig",
        dependencies = {
          {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
              library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
              },
            },
          },
        },
      },
    },

    opts = {
      ensure_installed = { "lua_ls", "pyright", "ltex", "bashls" },
      automatic_installation = true,
    },

    config = function(_, opts)
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup(opts)

      -- Enable all Mason-installed LSPs
      for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
        if server ~= "clangd" then -- exclude clangd override
          vim.lsp.config(server, { capabilities = capabilities })
          vim.lsp.enable(server)
        end
      end

      -- Manual clangd override (system installed)
      vim.lsp.config("clangd", {
        mason = false,
        cmd = {
          "clangd-21",
          "--background-index",
          "--header-insertion=iwyu",
          "--header-insertion-decorators",
          "--completion-style=detailed",
          "--clang-tidy",
        },
        capabilities = capabilities,
      })
      vim.lsp.enable("clangd")
    end,
  },
}

