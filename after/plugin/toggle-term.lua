require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = 'horizontal',
  size=12,
  close_on_exit=true,
  persist_size = true,
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction='float' })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- Keymaps
-- QOL (esc to exit term mode, q to kill)
