require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = 'horizontal',
  size=12,
  close_on_exit=true,
  persist_size = true,
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- Keymaps
-- QOL (esc to exit term mode, q to kill)
vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'q', ':lua CLOSE_TERMINAL()<CR><CR>', { noremap = true, silent = true })

-- toggle all/split 1-3 (only works for split terminals)
vim.api.nvim_set_keymap('n', '<leader>t1', '<cmd>ToggleTerm 1<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t2', '<cmd>ToggleTerm 2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t3', '<cmd>ToggleTerm 3<CR>', {noremap = true, silent = true})

-- terminals
vim.api.nvim_set_keymap("n", "t", "<cmd>ToggleTerm direction=horizontal size=10<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=100<CR><CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
