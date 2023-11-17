-- shortcuts
local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}

-- keymap("n", "<Space>", "<cmd>WhichKey<CR>", opts)

vim.g.mapleader = ""

-- Close buffer / exit nvim
keymap("n", 'q', "<Cmd>lua require('ijcc.utils').close_buffer()<CR>", opts)
-- Better Terminal Nav
----- Window Nav
keymap('n', '<C-Left>', ':wincmd h<CR>', opts)
keymap('n', '<C-Right>', ':wincmd l<CR>', opts)
keymap('n', '<C-Up>', ':wincmd k<CR>', opts)
keymap('n', '<C-Down>', ':wincmd j<CR>', opts)
-- File tree
-- keymap("n", "<leader>ft", ":NvimTreeToggle<CR>", opts)

-- -- Code Runner
-- vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })

-- Better indention
vim.keymap.set("n", "<lt>", "<lt><lt>", { silent = true, desc = "Outdent" })
vim.keymap.set("n", ">", ">>", { silent = true, desc = "Indent" })
vim.keymap.set("v", "<lt>", "<lt>gv", { silent = true, desc = "Outdent" })
vim.keymap.set("v", ">", ">gv", { silent = true, desc = "Indent" })
-- or with tab
vim.keymap.set("n", "<S-Tab>", "<lt><lt>", { silent = true, desc = "Outdent - n" })
vim.keymap.set("n", "<Tab>", ">>", { silent = true, desc = "Indent" })
vim.keymap.set("v", "<S-Tab>", "<lt>gv", { silent = true, desc = "Outdent" })
vim.keymap.set("v", "<Tab>", ">gv", { silent = true, desc = "Indent" })

-- Q.O.L
keymap("n", "Q", "<nop>")
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv")
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv") -- move highlighted (s-a-u/d vsc)
keymap("i", "jk", "<Esc>")

-- -- Copy to system clipboard for WSL specifically
-- keymap("n", "<leader>y", ":'<,'>w !clip.exe<CR><CR>")
-- keymap("v", "<leader>y", ":'<,'>w !clip.exe<CR><CR>")
--
--Terminal Esc
vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], {noremap = true, silent = true})
