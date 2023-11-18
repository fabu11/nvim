local builtin = require('telescope.builtin')

require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
