local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "<Right>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))

  vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))

  vim.keymap.set("n", "<Left>", api.node.navigate.parent_close, opts "Close Directory")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
  vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
  vim.keymap.del("n", "<C-k>", { buffer = bufnr })

  vim.keymap.set("n", "R", api.tree.reload)
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
  filters = {
        git_ignored = true,
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = {},
        exclude = {},
      },

  diagnostics = {
  enable = true,
  show_on_dirs = false,
  show_on_open_dirs = true,
  debounce_delay = 50,
  severity = {
    min = vim.diagnostic.severity.HINT,
    max = vim.diagnostic.severity.ERROR,
    }
  }
}
