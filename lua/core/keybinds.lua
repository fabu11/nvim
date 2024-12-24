local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better indention
keymap("n", "<lt>", "<lt><lt>", { silent = true, desc = "Outdent" })
keymap("n", ">", ">>", { silent = true, desc = "Indent" })
keymap("v", "<lt>", "<lt>gv", { silent = true, desc = "Outdent" })
keymap("v", ">", ">gv", { silent = true, desc = "Indent" })
-- or with tab
keymap("n", "<S-Tab>", "<lt><lt>", { silent = true, desc = "Outdent - n" })
keymap("n", "<Tab>", ">>", { silent = true, desc = "Indent" })
keymap("v", "<S-Tab>", "<lt>gv", { silent = true, desc = "Outdent" })
keymap("v", "<Tab>", ">gv", { silent = true, desc = "Indent" })

-- move line
keymap("v", "<C-A-Up>", ":m '<-2<CR>gv=gv")
keymap("v", "<C-A-Down>", ":m '>+1<CR>gv=gv")

--fast escape
keymap("i", "jk", "<Esc>")
vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jk', [[<C-\><C-n>]], { noremap = true, silent = true })



-- clipboard
vim.opt.clipboard = "unnamedplus"
