require("ijcc.keymap")
require("ijcc.opt")
require("ijcc.events")

local utils = require("ijcc.utils")
local color = utils.readSetting("colorscheme")
if color == nil then
   color = "onedark" --onedark will be default
end
vim.cmd("colorscheme " ..color)
