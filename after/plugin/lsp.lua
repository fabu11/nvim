
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Custom Binds
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    -- scroll up and down the documentation window
    ['<C-Up>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Down>'] = cmp.mapping.scroll_docs(4)
  })
})

lsp_zero.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = '⚠',
        warn = '⚠',
        hint = '🛈',
        info = '🛈'
	}
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"clangd", "jedi_language_server", "pyright", "jdtls", "lua_ls"},
  handlers = {
    lsp_zero.default_setup,
  },
})

-- Gets rid of vim error
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

require'lspconfig'.pyright.setup{
	settings = {
		{autoImportCompletion = true}
	}
}

require'lspconfig'.clangd.setup{
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
}
