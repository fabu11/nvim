
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- cmp

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


local cmp = require('cmp')
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
    "i",
    "s",
  }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, {
  "i",
  "s",
}),
    },
    sources = {
      { name = 'nvim_lsp' }, -- LSP source
      { name = 'luasnip' },  -- LuaSnip source
      -- Other sources...
    },
    formatting = {
      format = function(entry, vim_item)
        -- Customize the appearance of the completion items here
        vim_item.kind = string.format('%s %s', vim_item.kind, entry.source.name)
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "luasnip"
          -- Other sources...
        })[entry.source.name]
        return vim_item
      end,
    },
  })

-- Define your snippets here
require('luasnip').setup()


-- extras 
lsp_zero.set_preferences({
    suggest_lsp_servers = true,
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"clangd", "pyright", "jdtls", "lua_ls"},
  handlers = {
    lsp_zero.default_setup,
  },
})

-- Gets rid of vim error
require'lspconfig'.pyright.setup(
    {
        settings = {
            pyright = {
                autoImportCompletion = true
            },
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = 'openFilesOnly',
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = 'off'
                }
            }
        }
    }
)
require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}

require'lspconfig'.clangd.setup{
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
}


vim.lsp.handlers['textDocument/signatureHelp']  = vim.lsp.with(vim.lsp.handlers['signature_help'], {
    border = 'single',
    close_events = { "CursorMoved", "BufHidden" },
})

vim.keymap.set('i', '<c-s>', vim.lsp.buf.signature_help)
