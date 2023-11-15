-- shortcuts
local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}


vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Better Terminal Nav
----- Window Nav
keymap('n', '<C-Left>', ':wincmd h<CR>', opts)
keymap('n', '<C-Right>', ':wincmd l<CR>', opts)
keymap('n', '<C-Up>', ':wincmd k<CR>', opts)
keymap('n', '<C-Down>', ':wincmd j<CR>', opts)
----- Tab Nav
keymap('n', '\\1', ':tabn 1<CR>', opts)
keymap('n', '\\2', ':tabn 2<CR>', opts)
keymap('n', '\\3', ':tabn 3<CR>', opts)
keymap('n', '\\4', ':tabn 4<CR>', opts)
keymap('n', '\\5', ':tabn 5<CR>', opts)
keymap('n', '\\6', ':tabn 6<CR>', opts)
keymap('n', '\\7', ':tabn 7<CR>', opts)
keymap('n', '\\8', ':tabn 8<CR>', opts)
keymap('n', '\\9', ':tabn 9<CR>', opts)
--or--
keymap('n', '<leader>1', ':tabn 1<CR>', opts)
keymap('n', '<leader>2', ':tabn 2<CR>', opts)
keymap('n', '<leader>3', ':tabn 3<CR>', opts)
keymap('n', '<leader>4', ':tabn 4<CR>', opts)
keymap('n', '<leader>5', ':tabn 5<CR>', opts)
keymap('n', '<leader>6', ':tabn 6<CR>', opts)
keymap('n', '<leader>7', ':tabn 7<CR>', opts)
keymap('n', '<leader>8', ':tabn 8<CR>', opts)
keymap('n', '<leader>9', ':tabn 9<CR>', opts)
-- File tree
keymap("n", "<leader>ft", ":NvimTreeToggle<CR>", opts)

-- Code Runner
vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })

-- Q.O.L
keymap("n", "Q", "<nop>")
keymap("v", "<S-Up>", ":m '<-2<CR>gv=gv")
keymap("v", "<S-Down>", ":m '>+1<CR>gv=gv") -- move highlighted (s-a-u/d vsc)
keymap("i", "jk", "<Esc>")

-- Copy to system clipboard for WSL specifically
keymap("n", "<leader>y", ":'<,'>w !clip.exe<CR><CR>")
keymap("v", "<leader>y", ":'<,'>w !clip.exe<CR><CR>")


