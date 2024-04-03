-- shortcuts
local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}


vim.g.mapleader = ""

vim.api.nvim_set_keymap('n', '\\q', 'q', { noremap = true })
keymap("n", 'q', "<Cmd>lua require('ijcc.utils').close_buffer()<CR>", opts)
----- Window Nav
keymap({'n'}, '<C-Left>', ':wincmd h<CR>', opts)
keymap({'n'}, '<C-Right>', ':wincmd l<CR>', opts)
keymap({'n'}, '<C-Up>', ':wincmd k<CR>', opts)
keymap({'n'}, '<C-Down>', ':wincmd j<CR>', opts)
keymap({'t'}, '<C-Left>', '<C-\\><C-N>:wincmd h<CR>', opts)
keymap({'t'}, '<C-Right>', '<C-\\><C-N>:wincmd l<CR>', opts)
keymap({'t'}, '<C-Up>', '<C-\\><C-N>:wincmd k<CR>', opts)
keymap({'t'}, '<C-Down>', '<C-\\><C-N>:wincmd j<CR>', opts)

-- allows for :wqa with terminals open...


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

--Terminal Esc
vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], {noremap = true, silent = true})

-- Custom shiftwidth settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "h",
    command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "hpp",
    command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    command = "setlocal shiftwidth=2 tabstop=2",
})

